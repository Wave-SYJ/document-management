package cn.edu.seu.cose.docmanage.controller;

import cn.edu.seu.cose.docmanage.config.CurrentUser;
import cn.edu.seu.cose.docmanage.constants.RoleConstants;
import cn.edu.seu.cose.docmanage.entity.Announcement;
import cn.edu.seu.cose.docmanage.entity.Entry;

import cn.edu.seu.cose.docmanage.entity.Paper;

import cn.edu.seu.cose.docmanage.entity.Journal;

import cn.edu.seu.cose.docmanage.entity.User;
import cn.edu.seu.cose.docmanage.service.*;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Controller
public class AdminController {

    @Autowired
    private EntryService entryService;

    @Autowired
    private PaperService paperService;

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
    public String toAdminUser(@CurrentUser User user, Model model, Integer pageNum, String searchKey, String searchValue) {
        pageNum = pageNum != null ? pageNum : 1;
        model.addAttribute("dataPage", userService.findUserPage(pageNum, 10, searchKey, searchValue).toPageInfo());
        model.addAttribute("searchKey", searchKey);
        model.addAttribute("searchValue", searchValue);
        model.addAttribute("isSystemAdmin", user.getRoles().stream().anyMatch(role -> role.getName().equals(RoleConstants.ROLE_SYSTEM_ADMIN)));
        return "admin/user";
    }

    @RequestMapping("/admin/paper")
    @PreAuthorize("hasAuthority(@Roles.ROLE_DOCUMENT_ADMIN)")
    public String toAdminPaper(Model model, Integer pageNum, String searchKey, String searchValue) {
        pageNum = pageNum != null ? pageNum : 1;
        model.addAttribute("dataPage", paperService.findPaperPage(pageNum, 10, searchKey, searchValue).toPageInfo());
        model.addAttribute("searchKey", searchKey);
        model.addAttribute("searchValue", searchValue);
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


    @DeleteMapping("/paper")
    @PreAuthorize("hasAnyAuthority(@Roles.ROLE_DOCUMENT_ADMIN)")
    @ResponseBody
    public void deletePaper(@RequestBody List<UUID> ids) {
        paperService.deleteSpecifiedPaper(ids);
    }

    @PostMapping("/admin/paper")
    @PreAuthorize("hasAnyAuthority(@Roles.ROLE_DOCUMENT_ADMIN)")
    public String insertPaper(Paper paper) {
        if (paper.getId() == null)
            paperService.insertPaper(paper);
        else
        paperService.updatePaper(paper);
        return "redirect:/admin/paper";
    }

    @RequestMapping("/admin/announcement")
    public String toAdminAnnouncement(Model model, Integer pageNum,String searchKey, String searchValue,@CurrentUser User user){
        pageNum = pageNum != null ? pageNum : 1;
        PageInfo<Announcement> pageInfo = systemService.findAnnouncement(pageNum, 10).toPageInfo();
        model.addAttribute("dataPage", pageInfo);
        model.addAttribute("usernames",
                pageInfo.getList().stream().map(item -> userService.findUsernameById(item.getPublisherId())).collect(Collectors.toList())
        );
        model.addAttribute("searchKey", searchKey);
        model.addAttribute("searchValue", searchValue);
        return "admin/announcement";
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
        if (journal.getId() == null)
            journalService.insertJournal(journal);
        else
            journalService.updateJournal(journal);
        return "redirect:/admin/journal";
    }

    @PostMapping("/admin/paper/entry")
    @PreAuthorize("hasAnyAuthority(@Roles.ROLE_DOCUMENT_ADMIN)")
    public String bindPaperEntry(String id, String entries) {
        paperService.bindEntries(UUID.fromString(id), Arrays.asList(entries.split("\r\n")));
        return "redirect:/admin/paper";
    }


    @PostMapping("/admin/journal/entry")
    @PreAuthorize("hasAnyAuthority(@Roles.ROLE_DOCUMENT_ADMIN)")
    public String bindEntry(String id, String entries) {
        journalService.bindEntries(UUID.fromString(id), Arrays.asList(entries.split("\r\n")));
        return "redirect:/admin/journal";
    }

    @PostMapping("/admin/announcement")
    @PreAuthorize("hasAnyAuthority(@Roles.ROLE_SYSTEM_ADMIN)")
    public String insertAnnouncement(@CurrentUser User user, Announcement announcement) {
        announcement.setPublisherId(user.getId());
       systemService.publishAnnouncement(announcement);
        return "redirect:/admin/announcement";
    }

    @DeleteMapping("/admin/announcement")
    @PreAuthorize("hasAnyAuthority(@Roles.ROLE_SYSTEM_ADMIN)")
    @ResponseBody
    public void deleteAnnouncement(@RequestBody List<UUID> ids) {
        systemService.deleteAnnouncement(ids);
    }

    @RequestMapping("/admin/role")
    @PreAuthorize("hasAnyAuthority(@Roles.ROLE_SYSTEM_ADMIN)")
    public String modifyRole(String userId, String roleName, boolean add) {
        if (add)
            userService.insertUserRole(UUID.fromString(userId), roleName);
        else
            userService.deleteUserRole(UUID.fromString(userId), roleName);
        return "redirect:/admin/user";
    }
}
