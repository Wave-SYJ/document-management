package cn.edu.seu.cose.docmanage.controller;

import cn.edu.seu.cose.docmanage.config.CurrentUser;
import cn.edu.seu.cose.docmanage.entity.User;
import cn.edu.seu.cose.docmanage.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping({"/user", "/user/basic"})
    public String toUserBasic() {
        return "/user/basic";
    }

    @RequestMapping("/user/password")
    public String toUserPassword() {
        return "/user/password";
    }

    @PostMapping("/user/password")
    public String changePassword(@CurrentUser User user, String oldPassword, String newPassword, String repeatPassword) {
        userService.changePassword(user, oldPassword, newPassword, repeatPassword);
        return "/user/password";
    }

    @RequestMapping("/admin/collection")
    public void findUserCollection(UUID userId) {
        userService.findUserCollection(userId);
    }


    @DeleteMapping("/user")
    @PreAuthorize("hasAnyAuthority(@Roles.ROLE_USER_ADMIN)")
    @ResponseBody
    public void deleteUser(@RequestBody List<UUID> ids) {
        userService.deleteUsers(ids);
    }

}
