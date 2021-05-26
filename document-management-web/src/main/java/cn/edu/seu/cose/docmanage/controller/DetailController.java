package cn.edu.seu.cose.docmanage.controller;

import cn.edu.seu.cose.docmanage.config.CurrentUser;
import cn.edu.seu.cose.docmanage.entity.Journal;
import cn.edu.seu.cose.docmanage.entity.Paper;
import cn.edu.seu.cose.docmanage.entity.User;
import cn.edu.seu.cose.docmanage.service.EntryService;
import cn.edu.seu.cose.docmanage.service.JournalService;
import cn.edu.seu.cose.docmanage.service.PaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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

    @RequestMapping("detail/paper")
    public String toPaper(String id, Model model) {
        Paper paper = paperService.findPaperById(UUID.fromString(id));
        model.addAttribute("item", paper);
        model.addAttribute("searchType", "paper");
        model.addAttribute("searchKey", null);
        model.addAttribute("searchValue", null);
        model.addAttribute("paperList", paperService.findPaperPageByJournalId(1, 10,paper.getJournalId()).toPageInfo());
        return "/detail/paper";
    }

    @RequestMapping("detail/entry")
    public String toEntry(String id, Model model, @CurrentUser User user) {
        model.addAttribute("item", entryService.findEntryById(UUID.fromString(id)));
        model.addAttribute("searchType", "entry");
        model.addAttribute("searchKey", null);
        model.addAttribute("searchValue", null);
        System.out.println("print out journal");
        List<UUID> journalIds = entryService.findJournalIds(UUID.fromString(id));

        List<Journal> journals =journalIds.stream().map((item)-> journalService.findJournalById(item)).collect(Collectors.toList());
        model.addAttribute("journalData", journals);
        return "/detail/entry";
    }

    @RequestMapping("detail/journal")
    public String toJournal(String id, Model model) {
        Journal journal = journalService.findJournalById(UUID.fromString(id));
        model.addAttribute("item", journal);
        model.addAttribute("searchType", "journal");
        model.addAttribute("searchKey", null);
        model.addAttribute("searchValue", null);
        model.addAttribute("paperList", paperService.findPaperPageByJournalId(1, 10,journal.getId()).toPageInfo());
        return "/detail/journal";
    }
}
