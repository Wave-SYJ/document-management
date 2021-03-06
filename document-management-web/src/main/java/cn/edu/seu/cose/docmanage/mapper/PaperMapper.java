package cn.edu.seu.cose.docmanage.mapper;

import cn.edu.seu.cose.docmanage.entity.Entry;
import cn.edu.seu.cose.docmanage.entity.Paper;
import com.github.pagehelper.Page;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface PaperMapper {
    Page<Paper> findPaperPage(String searchKey, String searchValue);
    Page<Paper> findPaperPageByJournalId(UUID id);
    List<Paper> findAllPapers();
    void insertPaper(Paper paper);
    void deletePapers(List<UUID> paperId);
    void deleteSpecifiedPaper(List<UUID> id);
    void updatePaper(Paper paper);
    Paper findPaperById(UUID paperId);
    void bindEntry(UUID id, UUID paperId, UUID entryId);
    void removeAllEntries(UUID paperId);
    List<Entry> findEntries(UUID paperId);
    List<Paper> findNewPapers();
}