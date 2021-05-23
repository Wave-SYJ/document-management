package cn.edu.seu.cose.docmanage.service;
import cn.edu.seu.cose.docmanage.entity.Journal;
import cn.edu.seu.cose.docmanage.entity.Paper;
import cn.edu.seu.cose.docmanage.entity.User;
import cn.edu.seu.cose.docmanage.exception.SimpleException;
import cn.edu.seu.cose.docmanage.mapper.JournalMapper;
import cn.edu.seu.cose.docmanage.mapper.UserMapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class JournalService {

    @Autowired
    private JournalMapper journalMapper;

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

    public Journal findJournalId(UUID id){
        if(id==null)return null;
        return journalMapper.findJournalById(id);
    }

}
