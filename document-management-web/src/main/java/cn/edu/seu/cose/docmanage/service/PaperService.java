package cn.edu.seu.cose.docmanage.service;

import cn.edu.seu.cose.docmanage.entity.Paper;
import cn.edu.seu.cose.docmanage.mapper.PaperMapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaperService {

    @Autowired
    private PaperMapper paperMapper;

    public Page<Paper> findPaperPage(int pageNum, int pageSize, String searchKey, String searchValue) {
        PageHelper.startPage(pageNum, pageSize);
        return paperMapper.findPaperPage(searchKey, searchValue);
    }

}
