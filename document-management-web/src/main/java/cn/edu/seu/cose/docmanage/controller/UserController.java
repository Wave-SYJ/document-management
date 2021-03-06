package cn.edu.seu.cose.docmanage.controller;

import cn.edu.seu.cose.docmanage.config.CurrentUser;
import cn.edu.seu.cose.docmanage.entity.User;
import cn.edu.seu.cose.docmanage.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/user/password")
    public String toUserPassword() {
        return "/user/password";
    }

    @PostMapping("/user/password")
    public String changePassword(@CurrentUser User user, String oldPassword, String newPassword, String repeatPassword) {
        userService.changePassword(user, oldPassword, newPassword, repeatPassword);
        return "/user/password";
    }

    @RequestMapping("/user")
    public String toUser() {
        return "redirect:/user/collection";
    }

    @RequestMapping("/user/collection")
    public String toUserCollection(Model model, @CurrentUser User user, Integer pageNum, Integer pageSize,String searchKey, String searchValue) {
        pageNum = pageNum != null ? pageNum : 1;
        model.addAttribute("dataPage", userService.findUserCollectionPage(user.getId(),pageNum,10).toPageInfo());
        model.addAttribute("searchKey", searchKey);
        model.addAttribute("searchValue", searchValue);
        return "/user/collection";
    }

    @RequestMapping("/user/subscription")
    public String toAdminSubscription(Model model, Integer pageNum,String searchKey, String searchValue,@CurrentUser User user){
        pageNum = pageNum != null ? pageNum : 1;
        model.addAttribute("dataPage", userService.findUserSubscriptionPage(user.getId(),pageNum,10).toPageInfo());
        model.addAttribute("searchKey", searchKey);
        model.addAttribute("searchValue", searchValue);
        return "/user/subscription";
    }


    @DeleteMapping("/user")
    @PreAuthorize("hasAnyAuthority(@Roles.ROLE_USER_ADMIN)")
    @ResponseBody
    public void deleteUser(@RequestBody List<UUID> ids) {
        userService.deleteUsers(ids);
    }



    @DeleteMapping("/collection")
    @ResponseBody
    public void cancelCollection(@CurrentUser User user, @RequestBody List<UUID> paperids) {
        userService.cancelCollection(user.getId(), paperids);
    }

}
