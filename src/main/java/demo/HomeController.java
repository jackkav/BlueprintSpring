package demo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String Index() {
        return "Index";
    }
    @RequestMapping("/WIP")
    public String WIP() {
        return "WIP";
    }
}