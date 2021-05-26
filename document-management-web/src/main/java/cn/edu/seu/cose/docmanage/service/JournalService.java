package cn.edu.seu.cose.docmanage.service;
import cn.edu.seu.cose.docmanage.config.CurrentUser;
import cn.edu.seu.cose.docmanage.entity.Entry;
import cn.edu.seu.cose.docmanage.entity.Journal;
import cn.edu.seu.cose.docmanage.entity.Paper;
import cn.edu.seu.cose.docmanage.entity.User;
import cn.edu.seu.cose.docmanage.exception.SimpleException;
import cn.edu.seu.cose.docmanage.mapper.EntryMapper;
import cn.edu.seu.cose.docmanage.mapper.JournalMapper;
import cn.edu.seu.cose.docmanage.mapper.UserMapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class JournalService {

    @Autowired
    private JournalMapper journalMapper;

    @Autowired
    private EntryService entryService;

    public Page<Journal> findJournalMapper(int pageNum, int pageSize, String searchKey, String searchValue) {
        PageHelper.startPage(pageNum, pageSize);
        return journalMapper.findJournalPage(searchKey, searchValue);
    }

    public void insertJournal(Journal journal) {
        if (journal.getId() == null)
            journal.setId(UUID.randomUUID());
        journalMapper.insertJournal(journal);
    }

    public void deleteJournals(List<UUID> journalIds) {
        journalMapper.deleteJournals(journalIds);
    }

    public void updateJournal(Journal newJournal){
        journalMapper.updateJournal(newJournal);
    }

    public Page<Journal> findJournalPage(int pageNum, int pageSize, String searchKey, String searchValue) {
        PageHelper.startPage(pageNum, pageSize);
        return journalMapper.findJournalPage(searchKey, searchValue);
    }

    @Transactional
    public void bindEntries(UUID journalId, List<String> entryNames) {
        journalMapper.removeAllEntries(journalId);
        entryNames = entryNames.stream().filter(StringUtils::hasText).collect(Collectors.toList());
        if (entryNames.isEmpty())
            return;
        entryService.findEntryByNames(entryNames).forEach(entry -> {
            journalMapper.bindEntry(UUID.randomUUID(), journalId, entry.getId());
        });
    }

    public List<Entry> findEntries(UUID journalId) {
        return journalMapper.findEntries(journalId);
    }

    public void insertSubscription(UUID userId,UUID journalId) {
        if (journalId == null)
           return;
        journalMapper.insertSubscription(UUID.randomUUID(),userId,journalId);
    }

    public boolean ifSubscription(UUID userId,UUID journalId){
        return journalMapper.ifSubscribed(userId,journalId);
    }
}
