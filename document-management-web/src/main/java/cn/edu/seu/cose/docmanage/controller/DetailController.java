package cn.edu.seu.cose.docmanage.controller;

import cn.edu.seu.cose.docmanage.config.CurrentUser;
import cn.edu.seu.cose.docmanage.entity.Journal;
import cn.edu.seu.cose.docmanage.entity.Paper;
import cn.edu.seu.cose.docmanage.entity.User;
import cn.edu.seu.cose.docmanage.service.EntryService;
import cn.edu.seu.cose.docmanage.service.JournalService;
import cn.edu.seu.cose.docmanage.service.PaperService;
import cn.edu.seu.cose.docmanage.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Controller
public class DetailController {
    @Autowired
    private PaperService paperService;

    @Autowired
    private JournalService journalService;

    @Autowired
    private EntryService entryService;

    @Autowired
    private UserService userService;

    @RequestMapping("detail/paper")
    public String toPaper(String id, Model model, @CurrentUser User user) {
        Paper paper = paperService.findPaperById(UUID.fromString(id));
        model.addAttribute("item", paper);
        model.addAttribute("searchType", "paper");
        model.addAttribute("searchKey", null);
        model.addAttribute("searchValue", null);
        model.addAttribute("isCollected",userService.isCollected(user.getId(),UUID.fromString(id)));
        model.addAttribute("paperList", paperService.findPaperPageByJournalId(1, 10,paper.getJournalId()).toPageInfo());
        return "/detail/paper";
    }

    @RequestMapping("detail/paper/collected")
    public String CollectedPaper(String paper_id,@CurrentUser User user){
        userService.addCollection(user.getId(),UUID.fromString(paper_id));
        return "redirect:/detail/paper?id=" + paper_id;
    }

    @RequestMapping("detail/paper/cancelCollected")
    public String CancelCollectedPaper(String paper_id,@CurrentUser User user){
        userService.deleteCollection(user.getId(),UUID.fromString(paper_id));
        return "redirect:/detail/paper?id=" + paper_id;
    }

    @RequestMapping("detail/entry")
    public String toEntry(String id, Model model) {
        List<UUID> journalIds = entryService.findJournalIds(UUID.fromString(id));
        List<Journal> journals =journalIds.stream().map((item)-> journalService.findJournalById(item)).collect(Collectors.toList());
        model.addAttribute("item", entryService.findEntryById(UUID.fromString(id)));
        model.addAttribute("searchType", "entry");
        model.addAttribute("searchKey", null);
        model.addAttribute("searchValue", null);
        model.addAttribute("journalData", journals);
        model.addAttribute("paperData", entryService.findPaperIds(UUID.fromString(id)).stream().map(paperService::findPaperById).collect(Collectors.toList()));
        return "/detail/entry";
    }

    @RequestMapping("detail/journal")
    public String toJournal(String id, Model model, @CurrentUser User user) {
        Journal journal = journalService.findJournalById(UUID.fromString(id));
        model.addAttribute("item", journal);
        model.addAttribute("searchType", "journal");
        model.addAttribute("searchKey", null);
        model.addAttribute("searchValue", null);
        model.addAttribute("isSubscribed",journalService.ifSubscribed(user.getId(),UUID.fromString(id)));
        model.addAttribute("paperList", paperService.findPaperPageByJournalId(1, 10,journal.getId()).toPageInfo());
        return "/detail/journal";
    }

    @RequestMapping("detail/journal/subscribed")
    public String SubscribedJournal(String journal_id,@CurrentUser User user){
        journalService.insertSubscription(user.getId(),UUID.fromString(journal_id));
        return "redirect:/detail/journal?id="+journal_id;
    }

    @RequestMapping("detail/journal/cancelSubscribed")
    public String CancelSubscribedJournal(String journal_id,@CurrentUser User user){
        List<UUID> list= Collections.singletonList(UUID.fromString(journal_id));
        System.out.println(list);
        userService.deleteSubscriptions(list,user.getId());
        return "redirect:/detail/journal?id="+journal_id;
    }

}
