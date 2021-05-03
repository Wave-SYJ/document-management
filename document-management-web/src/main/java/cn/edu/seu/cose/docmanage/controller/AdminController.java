package cn.edu.seu.cose.docmanage.controller;

import cn.edu.seu.cose.docmanage.config.CurrentUser;
import cn.edu.seu.cose.docmanage.constants.RoleConstants;
import cn.edu.seu.cose.docmanage.entity.User;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

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
    public String toAdminUser() {
        return "admin/user";
    }

}
