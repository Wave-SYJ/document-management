package cn.edu.seu.cose.docmanage.service;

import cn.edu.seu.cose.docmanage.entity.Paper;
import cn.edu.seu.cose.docmanage.mapper.PaperMapper;
import cn.edu.seu.cose.docmanage.mapper.UserMapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
public class PaperService {

    @Autowired
    private PaperMapper paperMapper;

    public Page<Paper> findPaperPage(int pageNum, int pageSize, String searchKey, String searchValue) {
        PageHelper.startPage(pageNum, pageSize);
        return paperMapper.findPaperPage(searchKey, searchValue);
    }

    @Transactional
    public void insetPaper(Paper paper){
        if(paper.getId()==null)
            paper.setId(UUID.randomUUID());

        paperMapper.insertPaper(paper);

    }


    public void deleteAllPapers(List<UUID> paperIds){
        paperMapper.deletePapers(paperIds);
    }
    public void deleteSpecifiedPaper(List<UUID> id){
        if(id==null)
            return;
        paperMapper.deleteSpecifiedPaper(id);
    }

    public void updatePaper(Paper paper){
        if(paper==null)
            return;
        paperMapper.updatePaper(paper);
    }

}
