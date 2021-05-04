package cn.edu.seu.cose.docmanage.controller;

import cn.edu.seu.cose.docmanage.config.CurrentUser;
import cn.edu.seu.cose.docmanage.constants.RoleConstants;
import cn.edu.seu.cose.docmanage.entity.User;
import cn.edu.seu.cose.docmanage.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class AdminController {

    @Autowired
    private UserService userService;

    @RequestMapping("/admin")
    @PreAuthorize("hasAnyAuthority(@Roles.ROLE_USER_ADMIN, @Roles.ROLE_DOCUMENT_ADMIN, @Roles.ROLE_SYSTEM_ADMIN)")
    public String toAdmin(@CurrentUser User user) {
        if (user.getRoles().stream().anyMatch(role -> RoleConstants.ROLE_USER_ADMIN.equals(role.getName())))
            return "redirect:/admin/user";
        if (user.getRoles().stream().anyMatch(role -> RoleConstants.ROLE_DOCUMENT_ADMIN.equals(role.getName())))
            return "redirect:/admin/paper";
        if (user.getRoles().stream().anyMatch(role -> RoleConstants.ROLE_SYSTEM_ADMIN.equals(role.getName())))
            return "redirect:/admin/system";
        return "index";
    }

    @RequestMapping("/admin/user")
    @PreAuthorize("hasAuthority(@Roles.ROLE_USER_ADMIN)")
    public String toAdminUser(Model model, Integer pageNum, Integer pageSize) {
        pageNum = pageNum != null ? pageNum : 1;
        pageSize = pageSize != null ? pageSize : 10;
        model.addAttribute("dataPage", userService.findUserPage(pageNum, pageSize).toPageInfo());
        return "admin/user";
    }

    @RequestMapping("/admin/paper")
    @PreAuthorize("hasAuthority(@Roles.ROLE_DOCUMENT_ADMIN)")
    public String toAdminPaper() {
        return "admin/paper";
    }

    @RequestMapping("/admin/journal")
    @PreAuthorize("hasAuthority(@Roles.ROLE_DOCUMENT_ADMIN)")
    public String toAdminJournal() {
        return "admin/journal";
    }

    @RequestMapping("/admin/entry")
    @PreAuthorize("hasAuthority(@Roles.ROLE_DOCUMENT_ADMIN)")
    public String toAdminEntry() {
        return "admin/entry";
    }

    @RequestMapping("/admin/system")
    @PreAuthorize("hasAuthority(@Roles.ROLE_SYSTEM_ADMIN)")
    public String toAdminSystem() {
        return "admin/system";
    }


}