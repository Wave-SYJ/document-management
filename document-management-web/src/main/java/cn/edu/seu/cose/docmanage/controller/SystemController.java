package cn.edu.seu.cose.docmanage.controller;

import cn.edu.seu.cose.docmanage.service.EntryService;
import cn.edu.seu.cose.docmanage.service.JournalService;
import cn.edu.seu.cose.docmanage.service.PaperService;
import cn.edu.seu.cose.docmanage.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.UUID;

@Controller
public class SystemController {

    @RequestMapping("/login")
    public String toLogin() {
        return "login";
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
        model.addAttribute("announcementPage",systemService.findNewAnnouncement());
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

    @RequestMapping("detail/paper")
    public String toResult(String id, Model model) {
        model.addAttribute("item", paperService.findPaperById(UUID.fromString(id)));
        return "/detail/paper";
    }


}
