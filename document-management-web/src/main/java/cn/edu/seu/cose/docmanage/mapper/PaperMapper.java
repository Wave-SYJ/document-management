package cn.edu.seu.cose.docmanage.mapper;

import cn.edu.seu.cose.docmanage.entity.Paper;
import com.github.pagehelper.Page;
import org.springframework.stereotype.Repository;

@Repository
public interface PaperMapper {

    Page<Paper> findPaperPage(String searchKey, String searchValue);
}
