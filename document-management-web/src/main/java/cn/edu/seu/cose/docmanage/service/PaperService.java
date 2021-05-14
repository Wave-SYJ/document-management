package cn.edu.seu.cose.docmanage.service;

import cn.edu.seu.cose.docmanage.entity.Paper;
import cn.edu.seu.cose.docmanage.mapper.PaperMapper;
import cn.edu.seu.cose.docmanage.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
public class PaperService {

    @Autowired
    private PaperMapper paperMapper;

    @Transactional
    public void insetPaper(Paper paper){
        if(paper.getId()==null)
            paper.setId(UUID.randomUUID());

        paperMapper.insertPaper(paper);

    }


    public void deleteAllPapers(List<UUID> paperIds){
        paperMapper.deletePapers(paperIds);
    }

    public void updatePaper(Paper paper){
        if(paper==null)
            return;
        paperMapper.updatePaper(paper);
    }

}
