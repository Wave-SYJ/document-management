package cn.edu.seu.cose.docmanage.mapper;

import cn.edu.seu.cose.docmanage.config.CurrentUser;
import cn.edu.seu.cose.docmanage.entity.Entry;
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
    void bindEntry(UUID id, UUID journalId, UUID entryId);
    void removeAllEntries(UUID journalId);
    List<Entry> findEntries(UUID journalId);

    void insertSubscription(UUID id,UUID uerId,UUID journalId);
    boolean ifSubscribed(UUID userId,UUID journalId);
}
