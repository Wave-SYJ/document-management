package cn.edu.seu.cose.docmanage.controller;

import cn.edu.seu.cose.docmanage.entity.User;
import cn.edu.seu.cose.docmanage.mapper.DemoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class DemoController {

    @Autowired
    private DemoMapper demoMapper;

    @RequestMapping("demo")
    public String demo(Model model) {
        List<User> allUser = demoMapper.findAllUser();
        model.addAttribute("users", allUser);
        return "/demo/index";
    }

}
