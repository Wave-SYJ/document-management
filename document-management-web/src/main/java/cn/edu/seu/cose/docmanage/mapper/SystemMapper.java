package cn.edu.seu.cose.docmanage.mapper;

import cn.edu.seu.cose.docmanage.entity.Announcement;
import com.github.pagehelper.Page;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface SystemMapper {
    Page<Announcement> findAnnouncement();
    void insertAnnouncement(Announcement announcement);
    void deleteAnnouncement(List<UUID> announcementIdList);
    List<Announcement> findNewAnnouncement();
}
