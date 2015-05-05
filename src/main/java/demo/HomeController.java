package demo;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.util.JSON;
import demo.domain.Client;
import org.dom4j.io.DOMReader;
import org.jongo.MongoCollection;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.webjars.RequireJS;
import org.webjars.WebJarAssetLocator;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.util.List;
import java.util.Set;

//TODO: i18n
//TODO: Security

@Controller
public class HomeController {

    @Autowired
    private ArticleRepository repository;
    @Autowired
    private JournalRepository repository2;

    @Autowired
    private MongoCollection users;

    @Autowired
    private ApplicationContext applicationContext;


    @RequestMapping("/")
    public String Index() {
        return "redirect:home";
    }

    @RequestMapping("/register")
    public String register() {
        return "register";
    }

    @RequestMapping(value="/addUser",method= RequestMethod.POST)
    public String addUser(@Valid @ModelAttribute("userForm")UserForm userForm, BindingResult result, Model model){
        if(result.hasErrors()) {
            //new ModelAndView("register", bindingResult.getModel());
            //model.addAttributes("result",result);
            model.addAttribute("errorLog", "has-error");
            model.addAttribute("username_error", result.getFieldError().getDefaultMessage());
            System.out.println("Has errors=" + result.hasErrors()); // Output: Has errors=true
            for (FieldError err:result.getFieldErrors()){
                System.out.println(err.getDefaultMessage()); // Output: must be greater than or equal to 10
            }
            return "register";
        }
        return "redirect:/home";
    }
    @RequestMapping("home")
    public String home(Model model){

        return "home";
    }

    @RequestMapping(value="/search",method= RequestMethod.POST)
    public String search(Model model, String query){
        model.addAttribute("resultSet", repository.findByTitleLike(query));
        return "result";
    }

    @Secured({"ROLE_ADMIN"})
    @RequestMapping("admin")
    public String admin(@AuthenticationPrincipal UserDetails userDetails, Model model){
        if(userDetails==null)return "redirect:home";
        String user = userDetails.getUsername();
        if(user.isEmpty())return "redirect:home";
        Client client = users.findOne("{#: #}", Client.USERNAME, user).as(Client.class);
        model.addAttribute("user",client.toString());
        return "admin";
    }


    @RequestMapping("upload")
    public String upload(){
        return "upload";
    }

    @RequestMapping(value="/saveXML", method= RequestMethod.POST )
    public @ResponseBody String saveXML(@RequestParam("file") List<MultipartFile> file){
        String result = "";
        for (MultipartFile content : file){
            if (!content.isEmpty()) {//TODO: add unit tests, refactor
                try {
                    DocumentBuilder db = DocumentBuilderFactory.newInstance().newDocumentBuilder();
                    Document doc = db.parse(content.getInputStream());
                    DOMReader xmlReader = new DOMReader();
                    String xml = xmlReader.read(doc).asXML();
                    JSONObject json = XML.toJSONObject(xml);
                    DBObject dbObject = (DBObject) JSON.parse(json.toString());
                    //TODO: tidy up data access
                    Mongo mongo = new Mongo("localhost", 27017);
                    DB db2 = mongo.getDB("demo");
                    DBCollection collection = db2.getCollection("article");
                    collection.insert(dbObject);

                } catch (Exception e) {
                    result+=content.getOriginalFilename() + " failed to upload!</br>";
                }
            }
        }
        if(result.isEmpty()){
            return "File has been successfully uploaded ";
        }else {
            return result;
        }
    }

    @RequestMapping("/wip")
    public String wip(Model model) {
        model.addAttribute("articles", repository.findAll());
        model.addAttribute("journals", repository2.findAll());
        return "wip";

    }
    @RequestMapping(value="/addArticle",method= RequestMethod.POST)
    public String addArticle(@ModelAttribute("article")Article article, Model model){
        repository.save(article);
        return "redirect:/wip";
    }
    @RequestMapping(value="/addJournal",method= RequestMethod.POST)
    public String addJournal(@ModelAttribute("journal")Journal journal, Model model){
        repository2.save(journal);
        return "redirect:/wip";
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
}