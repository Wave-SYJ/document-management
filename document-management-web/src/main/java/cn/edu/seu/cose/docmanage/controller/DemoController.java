package cn.edu.seu.cose.docmanage.controller;

import cn.edu.seu.cose.docmanage.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DemoController {

    @Autowired
    private UserMapper userMapper;

    @RequestMapping("demo")
    @PreAuthorize("permitAll()")
    public String toDemo(Model model) {
        model.addAttribute("users", userMapper.selectAllUsers());
        return "/demo/index";
    }
}
