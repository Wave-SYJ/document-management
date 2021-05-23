package cn.edu.seu.cose.docmanage.service;

import cn.edu.seu.cose.docmanage.entity.Entry;
import cn.edu.seu.cose.docmanage.entity.Paper;
import cn.edu.seu.cose.docmanage.mapper.PaperMapper;
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

    @Autowired
    private EntryService entryService;

    public Page<Paper> findPaperPage(int pageNum, int pageSize, String searchKey, String searchValue) {
        PageHelper.startPage(pageNum, pageSize);
        return paperMapper.findPaperPage(searchKey, searchValue);
    }

    public Paper findPaperById(UUID paperId) {
        if (paperId == null)
            return null;
        return paperMapper.findPaperById(paperId);
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

    @Transactional
    public void bindEntries(UUID paperId, List<String> entryNames) {
        paperMapper.removeAllEntries(paperId);
        entryService.findEntryByNames(entryNames).forEach(entry -> {
            paperMapper.bindEntry(UUID.randomUUID(), paperId, entry.getId());
        });
    }

    public List<Entry> findEntries(UUID paperId) {
        return paperMapper.findEntries(paperId);
    }

    @Transactional
    public List<Paper> findNewPapers(){
        return paperMapper.findNewPapers();
    }
}

