package cn.edu.seu.cose.docmanage.service;


import cn.edu.seu.cose.docmanage.entity.Entry;
import cn.edu.seu.cose.docmanage.entity.User;
import cn.edu.seu.cose.docmanage.exception.SimpleException;
import cn.edu.seu.cose.docmanage.mapper.EntryMapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.UUID;

@Service
public class EntryService {

    @Autowired
    private EntryMapper entryMapper;

    public void insertEntry(Entry entry){
        if(entry.getId()==null){
            entry.setId(UUID.randomUUID());
        }
        if(!StringUtils.hasText(entry.getName())){
            throw new SimpleException("词条名称不能为空");
        }
        if(!StringUtils.hasText(entry.getDescription())){
            throw new SimpleException("词条描述不能为空");
        }
        entryMapper.insertEntry(entry);
    }

    public void deleteEntry(List<UUID> entryIdList){
        entryMapper.deleteEntry(entryIdList);
    }

    public void updateEntry(Entry entry){
        if(entry==null)throw new SimpleException("词条内容为空");
        if(!StringUtils.hasText(entry.getName())){
            throw new SimpleException("词条名称不能为空");
        }
        if(!StringUtils.hasText(entry.getDescription())){
            throw new SimpleException("词条描述不能为空");
        }
        entryMapper.updateEntry(entry);
    }

    public Page<Entry> findEntry(int pageNum, int pageSize, String entryName) {
        PageHelper.startPage(pageNum, pageSize);
        return entryMapper.findEntry(entryName);
    }
}
