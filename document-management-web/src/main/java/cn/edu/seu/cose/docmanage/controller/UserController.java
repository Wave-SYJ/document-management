package cn.edu.seu.cose.docmanage.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

    @RequestMapping("/user")
//    @PreAuthorize("hasAuthority(@Roles.ROLE_USER_ADMIN)")
    public String toUserIndex() {
        return "/user/index";
    }

}
