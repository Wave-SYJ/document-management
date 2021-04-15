package cn.edu.seu.cose.docmanage.controller;

import cn.edu.seu.cose.docmanage.mapper.DemoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DemoController {

    @Autowired
    private DemoMapper demoMapper;

    @RequestMapping("demo")
    public String demo(Model model) {
        model.addAttribute("users", demoMapper.findAllUser());
        return "/demo/index";
    }

}
