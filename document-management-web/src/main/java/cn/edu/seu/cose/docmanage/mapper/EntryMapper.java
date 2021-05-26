package cn.edu.seu.cose.docmanage.mapper;

import cn.edu.seu.cose.docmanage.entity.Entry;
import cn.edu.seu.cose.docmanage.entity.Journal;
import com.github.pagehelper.Page;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface EntryMapper {
    void insertEntry(Entry entry);
    void deleteEntry(List<UUID> entryIdList);
    void updateEntry(Entry entry);
    Entry findEntryById(UUID id);
    Page<Entry> findEntryPage(String searchKey, String searchValue);
    List<Entry> findEntriesByNames(List<String> names);
    List<UUID> findJournalIds(UUID id);
    List<UUID> findPaperIds(UUID id);
}
