package cn.edu.seu.cose.docmanage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SearchController {

    @RequestMapping({"/", "/index"})
    public String toIndex(String searchType, String searchKey, String searchValue, Model model) {
        model.addAttribute("searchType", searchType != null ? searchType : "paper");
        model.addAttribute("searchKey", searchKey);
        model.addAttribute("searchValue", searchValue);

        return "index";
    }

}
