package demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
    @RequestMapping(value="/search",method= RequestMethod.POST)
    public String search(Model model, String query){
        model.addAttribute("resultSet", repository.findByTitle(query));
        return "result";
    }
}