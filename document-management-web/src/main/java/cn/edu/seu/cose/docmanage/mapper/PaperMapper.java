
package cn.edu.seu.cose.docmanage.mapper;

import cn.edu.seu.cose.docmanage.entity.Paper;
import com.github.pagehelper.Page;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface PaperMapper {
    Page<Paper> findPaperPage(String searchKey, String searchValue);
    List<Paper> findAllPapers();
    void insertPaper(Paper paper);
    void deletePapers(List<UUID> paperId);
    void deleteSpecifiedPaper(UUID id);
    void updatePaper(Paper paper);
}

