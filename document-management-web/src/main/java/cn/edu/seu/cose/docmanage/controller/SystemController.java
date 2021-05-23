package cn.edu.seu.cose.docmanage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SystemController {

    @RequestMapping("/login")
    public String toLogin() {
        return "login";
    }

    @RequestMapping({"/", "/index"})
    public String toIndex(String searchType, String searchKey, String searchValue, Model model) {
        model.addAttribute("searchType", searchType != null ? searchType : "paper");
        model.addAttribute("searchKey", searchKey);
        model.addAttribute("searchValue", searchValue);

        return "index";
    }

    @RequestMapping("result")
    public String toResult(String searchType, String searchKey, String searchValue, Integer pageNum, Model model) {
        model.addAttribute("searchType", searchType);
        model.addAttribute("searchKey", searchKey);
        model.addAttribute("searchValue", searchValue);
        return "result";
    }
}
