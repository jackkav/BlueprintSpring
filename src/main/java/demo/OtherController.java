package demo;


import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.util.JSON;
import org.dom4j.io.DOMReader;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.w3c.dom.Document;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.util.List;

@Controller
public class OtherController {


    @Autowired
    private ArticleRepository repository;
    @Autowired
    private JournalRepository repository2;

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
    public @ResponseBody
    String saveXML(@RequestParam("file") List<MultipartFile> file){
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
}
