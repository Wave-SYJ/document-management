package cn.edu.seu.cose.docmanage.controller;

import cn.edu.seu.cose.docmanage.entity.Role;
import cn.edu.seu.cose.docmanage.entity.User;
import cn.edu.seu.cose.docmanage.mapper.DemoMapper;
import cn.edu.seu.cose.docmanage.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

@Controller
public class DemoController {

    @Autowired
    private UserService userService;

    @Autowired
    private DemoMapper demoMapper;

    @RequestMapping("/demo")
    public String toDemo(Model model) {
        List<Role> roles = demoMapper.selectAllRoles();
        model.addAttribute("roles", roles);
        return "/user/demo";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(String username, String password) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

        User user = new User();
        user.setId(UUID.randomUUID());
        user.setUsername(username);
        user.setPassword(passwordEncoder.encode(password));
        demoMapper.insertUser(user);

        return "/user/demo";
    }

}
