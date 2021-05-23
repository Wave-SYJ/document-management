package cn.edu.seu.cose.docmanage.service;

import cn.edu.seu.cose.docmanage.entity.Announcement;
import cn.edu.seu.cose.docmanage.entity.Entry;
import cn.edu.seu.cose.docmanage.entity.SystemHardwareInfo;
import cn.edu.seu.cose.docmanage.exception.SimpleException;
import cn.edu.seu.cose.docmanage.mapper.SystemMapper;
import cn.edu.seu.cose.docmanage.mapper.UserMapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import oshi.SystemInfo;
import oshi.hardware.HardwareAbstractionLayer;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class SystemService {

    @Autowired
    private SystemMapper systemMapper;

    public void publishAnnouncement (Announcement announcement){
        if (announcement.getId()==null){
            announcement.setId(UUID.randomUUID());
        }
        if(!StringUtils.hasText(announcement.getContent())){
            throw new SimpleException("公告的内容不能为空");
        }
        announcement.setPublishTime(new Date());
        systemMapper.insertAnnouncement(announcement);
    }

    public void deleteAnnouncement(List<UUID> ids) {
        systemMapper.deleteAnnouncement(ids);
    }

    public Page<Announcement> findAnnouncement(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return systemMapper.findAnnouncement();
    }

    public SystemHardwareInfo querySystemStatus() throws Exception {
        return new SystemHardwareInfo();
    }

    @Transactional
    public List<Announcement> findNewAnnouncement(){
        return systemMapper.findNewAnnouncement();
    }

    public void openService() {}
    public void closeService() {}
}
