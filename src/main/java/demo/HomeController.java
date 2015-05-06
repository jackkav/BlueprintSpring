package demo;

import demo.domain.Client;
import org.jongo.MongoCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.ModelAndView;
import org.webjars.RequireJS;
import org.webjars.WebJarAssetLocator;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Set;

//TODO: i18n
//TODO: Security

@Controller
public class HomeController {

    @Autowired
    private MongoCollection users;

    @RequestMapping("/")
    public String Index() {
        return "redirect:home";
    }

    @RequestMapping("/register")
    public String register() {
        return "register";
    }

    @RequestMapping("home")
    public String home(){

        return "home";
    }

    @Secured({"ROLE_ADMIN"})
    @RequestMapping("admin")
    public String admin(@AuthenticationPrincipal UserDetails userDetails, Model model){
        if(userDetails==null)return "redirect:home";
        String user = userDetails.getUsername();
        if(user.isEmpty())return "redirect:home";
        Client client = users.findOne("{#: #}", Client.USERNAME, user).as(Client.class);
        model.addAttribute("user", client.toString());
        return "admin";
    }

    @ResponseBody
    @RequestMapping(value = "/webjarsjs", produces = "application/javascript")
    public String webjarjs() {
        return RequireJS.getSetupJavaScript("/webjars/");
    }

    @ResponseBody
    @RequestMapping("/webjarslocator/{webjar}/**")
    public ResponseEntity locateWebjarAsset(@PathVariable String webjar, HttpServletRequest request) {
        try {
            String mvcPrefix = "/webjarslocator/" + webjar + "/"; // This prefix must match the mapping path!
            String mvcPath = (String) request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
            WebJarAssetLocator locator = new WebJarAssetLocator();
            String fullPath = locator.getFullPath(webjar, mvcPath.substring(mvcPrefix.length()));
            Set<String> assets =locator.listAssets();
            return new ResponseEntity(new ClassPathResource(fullPath), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);//TODO: while debug mode is active dump webjars
        }
    }

    @RequestMapping(value="/addUser",method= RequestMethod.POST)
    public ModelAndView addUser(@ModelAttribute("userForm") @Valid UserForm userForm, BindingResult result, Model model){
        if(result.hasErrors()) {
            ModelAndView mav = new ModelAndView("register", result.getModel());
            model.addAttribute("errorLog", "has-error");
            model.addAttribute("username_error", result.getFieldError().getDefaultMessage());
            System.out.println("Has errors=" + result.hasErrors()); // Output: Has errors=true
            for (FieldError err:result.getFieldErrors()){
                System.out.println(err.getDefaultMessage()); // Output: must be greater than or equal to 10
            }

            return mav;
        }
        return new ModelAndView("redirect:/home");
    }
}