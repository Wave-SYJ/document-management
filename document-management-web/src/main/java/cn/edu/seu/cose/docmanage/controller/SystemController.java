package cn.edu.seu.cose.docmanage.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SystemController {

    @RequestMapping("/login")
    @PreAuthorize("permitAll()")
    public String toLogin() {
        return "login";
    }
}
