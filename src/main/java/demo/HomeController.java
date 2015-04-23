package demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

@Controller
public class HomeController {

    @Autowired
    private ArticleRepository repository;
    @Autowired
    private JournalRepository repository2;

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
    public @ResponseBody String saveXML(@RequestParam("file") MultipartFile file){
        if (!file.isEmpty()) {
            try {
                DocumentBuilder db = DocumentBuilderFactory.newInstance().newDocumentBuilder();
                Document doc = db.parse(file.getInputStream());
                NodeList nodes = doc.getElementsByTagName("title");
                if(nodes!=null && nodes.getLength()!=0){
                    Article article = new Article();
                    article.setTitle(nodes.item(0).getTextContent());
                    repository.save(article);
                }
                return "File has been successfully uploaded ";
            } catch (Exception e) {
                return "File upload failed"  + ": " + e.getMessage();
            }
        } else {
            return "Unable to upload. File is empty.";
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

}