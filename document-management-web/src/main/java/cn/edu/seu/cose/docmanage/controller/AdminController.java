package cn.edu.seu.cose.docmanage.controller;

import cn.edu.seu.cose.docmanage.config.CurrentUser;
import cn.edu.seu.cose.docmanage.constants.RoleConstants;
import cn.edu.seu.cose.docmanage.entity.User;
import cn.edu.seu.cose.docmanage.service.SystemService;
import cn.edu.seu.cose.docmanage.service.UserService;
import cn.edu.seu.cose.docmanage.service.JournalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.UUID;

@Controller
public class AdminController {

    @Autowired
    private UserService userService;

    @Autowired
    private JournalService journalService;

    @Autowired
    private SystemService systemService;

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
    public String toAdminUser(Model model, Integer pageNum, String searchKey, String searchValue) {
        pageNum = pageNum != null ? pageNum : 1;
        model.addAttribute("dataPage", userService.findUserPage(pageNum, 10, searchKey, searchValue).toPageInfo());
        model.addAttribute("searchKey", searchKey);
        model.addAttribute("searchValue", searchValue);
        return "admin/user";
    }

    @RequestMapping("/admin/paper")
    @PreAuthorize("hasAuthority(@Roles.ROLE_DOCUMENT_ADMIN)")
    public String toAdminPaper() {
        return "admin/paper";
    }

    @DeleteMapping("/journal")
    @PreAuthorize("hasAnyAuthority(@Roles.ROLE_DOCUMENT_ADMIN)")
    @ResponseBody
    public void deleteJournal(@RequestBody List<UUID> ids) {
        journalService.deleteJournals(ids);
    }

    @RequestMapping("/admin/journal")
    @PreAuthorize("hasAuthority(@Roles.ROLE_DOCUMENT_ADMIN)")
    public String toAdminJournal(Model model, Integer pageNum,String searchKey, String searchValue) {
        pageNum = pageNum != null ? pageNum : 1;
        model.addAttribute("dataPage", journalService.findJournalPage(pageNum, 10, searchKey, searchValue).toPageInfo());
        model.addAttribute("searchKey", searchKey);
        model.addAttribute("searchValue", searchValue);
        return "admin/journal";
    }

    @RequestMapping("/admin/entry")
    @PreAuthorize("hasAuthority(@Roles.ROLE_DOCUMENT_ADMIN)")
    public String toAdminEntry() {
        return "admin/entry";
    }

    @RequestMapping("/admin/system")
    @PreAuthorize("hasAuthority(@Roles.ROLE_SYSTEM_ADMIN)")
    public String toAdminSystem(Model model) throws Exception {
        model.addAttribute("info", systemService.querySystemStatus());
        return "admin/system";
    }


}
