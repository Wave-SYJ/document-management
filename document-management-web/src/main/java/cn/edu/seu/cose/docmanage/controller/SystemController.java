package cn.edu.seu.cose.docmanage.controller;

import cn.edu.seu.cose.docmanage.entity.Entry;
import cn.edu.seu.cose.docmanage.entity.Journal;
import cn.edu.seu.cose.docmanage.exception.SimpleException;
import cn.edu.seu.cose.docmanage.mapper.UserMapper;
import cn.edu.seu.cose.docmanage.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Controller
public class SystemController {

    @RequestMapping("/login")
    public String toLogin(Model model, String error) {
        model.addAttribute("error", error != null);
        return "login";
    }

    @Autowired
    public UserMapper userMapper;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(String username, String password, String repeatPassword) throws UnsupportedEncodingException {
        try {
            userService.register(username, password, repeatPassword);
        } catch (SimpleException e) {
            return "redirect:/register?error=" + URLEncoder.encode(e.getMessage(), "utf-8");
        }
        return "redirect:/";
    }

    @RequestMapping("/register")
    public String toRegister(Model model, String error) {
        model.addAttribute("error", error);
        return "/register";
    }


    @Autowired
    public PaperService paperService;

    @Autowired
    public JournalService journalService;

    @Autowired
    public EntryService entryService;

    @Autowired
    public SystemService systemService;

    @RequestMapping({"/", "/index"})
    public String toIndex(String searchType, String searchKey, String searchValue, Model model) {
        model.addAttribute("searchType", searchType != null ? searchType : "paper");
        model.addAttribute("searchKey", searchKey);
        model.addAttribute("searchValue", searchValue);
        model.addAttribute("dataPage", paperService.findNewPapers());
        model.addAttribute("announcementPage", systemService.findNewAnnouncement());
        return "index";
    }

    @RequestMapping("result")
    public String toResult(String searchType, String searchKey, String searchValue, Integer pageNum, Model model) {
        pageNum = pageNum == null ? 1 : pageNum;
        model.addAttribute("searchType", searchType);
        model.addAttribute("searchKey", searchKey);
        model.addAttribute("searchValue", searchValue);
        model.addAttribute("pageNum", pageNum);

        if (!StringUtils.hasText(searchType) || "paper".equals(searchType))
            model.addAttribute("dataPage", paperService.findPaperPage(pageNum, 10, searchKey, searchValue).toPageInfo());
        if ("journal".equals(searchType))
            model.addAttribute("dataPage", journalService.findJournalMapper(pageNum, 10, searchKey, searchValue).toPageInfo());
        if ("entry".equals(searchType))
            model.addAttribute("dataPage", entryService.findEntryPage(pageNum, 10, searchKey, searchValue).toPageInfo());
        return "result";
    }

    @RequestMapping("journal/entry")
    @ResponseBody
    public List<String> findJournalEntries(String id) {
        List<Entry> entries = journalService.findEntries(UUID.fromString(id));
        return entries.stream().map(Entry::getName).collect(Collectors.toList());
    }

    @RequestMapping("paper/entry")
    @ResponseBody
    public List<String> findPaperEntries(String id) {
        List<Entry> entries = paperService.findEntries(UUID.fromString(id));
        return entries.stream().map(Entry::getName).collect(Collectors.toList());
    }

    @RequestMapping("journal/id")
    @ResponseBody
    public String findJournalId(String title) {
        UUID id = journalService.findJournalIdByTitle(title);
        if (id == null)
            return "";
        return id.toString();
    }

    @RequestMapping("journal/title")
    @ResponseBody
    public String findJournalTitle(String id) {
        Journal journal = journalService.findJournalById(UUID.fromString(id));
        if (journal == null)
            return "";
        return journal.getTitle();
    }
}
