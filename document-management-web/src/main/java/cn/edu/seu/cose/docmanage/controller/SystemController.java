package cn.edu.seu.cose.docmanage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SystemController {

    @RequestMapping("/login")
    public String toLogin() {
        return "login";
    }
}
