package cn.edu.seu.cose.docmanage.mapper;

import cn.edu.seu.cose.docmanage.entity.Journal;
import com.github.pagehelper.Page;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface JournalMapper {
    void insertJournal(Journal journal);
    void deleteJournals(List<UUID> journalIds);
    void updateJournal(Journal newJournal);
    Page<Journal> findJournalPage(String searchKey, String searchValue);
    Journal findJournalById(UUID id);
}
