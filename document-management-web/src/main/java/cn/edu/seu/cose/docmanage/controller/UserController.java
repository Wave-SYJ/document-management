package cn.edu.seu.cose.docmanage.controller;

import cn.edu.seu.cose.docmanage.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.UUID;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/user")
    @PreAuthorize("hasAnyAuthority(@Roles.ROLE_USER_ADMIN)")
    public String toUserIndex() {
        return "/user/index";
    }

    @DeleteMapping("/user")
    @PreAuthorize("hasAnyAuthority(@Roles.ROLE_USER_ADMIN)")
    @ResponseBody
    public void deleteUser(@RequestBody List<UUID> ids) {
        userService.deleteUsers(ids);
    }

}
