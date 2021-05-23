package cn.edu.seu.cose.docmanage.controller;

import cn.edu.seu.cose.docmanage.config.CurrentUser;
import cn.edu.seu.cose.docmanage.constants.RoleConstants;
import cn.edu.seu.cose.docmanage.entity.Entry;
import cn.edu.seu.cose.docmanage.entity.Journal;
import cn.edu.seu.cose.docmanage.entity.User;
import cn.edu.seu.cose.docmanage.service.EntryService;
import cn.edu.seu.cose.docmanage.service.SystemService;
import cn.edu.seu.cose.docmanage.service.UserService;
import cn.edu.seu.cose.docmanage.service.JournalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.UUID;

@Controller
public class AdminController {

    @Autowired
    private EntryService entryService;

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

    @DeleteMapping("/subscription")
    @ResponseBody
    public void deleteSubscription(@RequestBody List<UUID> ids,@CurrentUser User user) {
        userService.deleteSubscriptions(ids,user.getId());
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

    @RequestMapping("/admin/subscription")
    public String toAdminSubscription(Model model, Integer pageNum,String searchKey, String searchValue,@CurrentUser User user){
        pageNum = pageNum != null ? pageNum : 1;
        model.addAttribute("dataPage", userService.findUserSubscriptionPage(user.getId(),pageNum,10).toPageInfo());
        model.addAttribute("searchKey", searchKey);
        model.addAttribute("searchValue", searchValue);
        return "admin/subscription";
    }


    @RequestMapping("/admin/entry")
    @PreAuthorize("hasAuthority(@Roles.ROLE_DOCUMENT_ADMIN)")
    public String toAdminEntry(Model model, Integer pageNum, String searchKey, String searchValue) {
        pageNum = pageNum != null ? pageNum : 1;
        model.addAttribute("dataPage", entryService.findEntryPage(pageNum,10,searchValue,searchKey).toPageInfo());
        model.addAttribute("searchKey", searchKey);
        model.addAttribute("searchValue", searchValue);
        return "admin/entry";
    }

    @RequestMapping("/admin/system")
    @PreAuthorize("hasAuthority(@Roles.ROLE_SYSTEM_ADMIN)")
    public String toAdminSystem(Model model) throws Exception {
        model.addAttribute("info", systemService.querySystemStatus());
        return "admin/system";
    }

    @DeleteMapping("/admin/entry")
    @PreAuthorize("hasAnyAuthority(@Roles.ROLE_DOCUMENT_ADMIN)")
    @ResponseBody
    public void deleteEntry(@RequestBody List<UUID> ids) {
        entryService.deleteEntry(ids);
    }

    @PostMapping("/admin/entry")
    @PreAuthorize("hasAnyAuthority(@Roles.ROLE_DOCUMENT_ADMIN)")
    public String insertEntry(Entry entry) {
        if (entry.getId() == null)
            entryService.insertEntry(entry);
        else
            entryService.updateEntry(entry);
        return "redirect:/admin/entry";
    }

    @PostMapping("/admin/journal")
    @PreAuthorize("hasAnyAuthority(@Roles.ROLE_DOCUMENT_ADMIN)")
    public String insertJournal(Journal journal) {
        journalService.insertJournal(journal);
        return "redirect:/admin/journal";
    }
}
