package demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.HandlerMapping;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.webjars.RequireJS;
import org.webjars.WebJarAssetLocator;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.util.List;
import java.util.Set;

//TODO: i18n
//TODO: setup datatables
//TODO: set up sidebar


@Controller
public class HomeController {

    @Autowired
    private ArticleRepository repository;
    @Autowired
    private JournalRepository repository2;

    @RequestMapping("login")
    public String login(){
        return "login";
    }
    @RequestMapping("logout")
    public String logout(){
        return "home";
    }

    @RequestMapping("/")
    public String Index() {
        return "redirect:home";
    }

    @RequestMapping("home")
    public String home(){
        return "home";
    }

    @RequestMapping(value="/search",method= RequestMethod.POST)
    public String search(Model model, String query){
        model.addAttribute("resultSet", repository.findByTitleLike(query));
        return "result";
    }

    @RequestMapping("upload")
    public String upload(){
        return "upload";
    }

    @RequestMapping(value="/saveXML", method= RequestMethod.POST )
    public @ResponseBody String saveXML(@RequestParam("file") List<MultipartFile> file){
        String result = "";
        for (MultipartFile obj : file){
            if (!obj.isEmpty()) {//TODO: add unit tests, refactor
                try {
                    DocumentBuilder db = DocumentBuilderFactory.newInstance().newDocumentBuilder();
                    Document doc = db.parse(obj.getInputStream());
                    NodeList nodes = doc.getElementsByTagName("title");
                    if(nodes!=null && nodes.getLength()!=0){
                        Article article = new Article();
                        article.setTitle(nodes.item(0).getTextContent());
                        repository.save(article);
                    }
                } catch (Exception e) {
                    result+=obj.getOriginalFilename() + " failed to upload!</br>";
//                    return "File upload failed"  + ": " + e.getMessage();
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