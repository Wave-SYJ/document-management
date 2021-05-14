package cn.edu.seu.cose.docmanage.mapper;

import cn.edu.seu.cose.docmanage.entity.Paper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface PaperMapper {
    List<Paper> findAllPapers();
    void insertPaper(Paper paper);
    void deletePapers(List<UUID> paperId);
    void updatePaper(Paper paper);

}
