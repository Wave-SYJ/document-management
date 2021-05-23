package cn.edu.seu.cose.docmanage.TzTest;

import cn.edu.seu.cose.docmanage.entity.Announcement;
import cn.edu.seu.cose.docmanage.service.SystemService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.stream.Collectors;

@SpringBootTest
public class SystemTester {

    @Autowired
    private SystemService systemService;

    @Test
    public void  insert(){
        for (int i = 0; i < 100; i++) {
            systemService.publishAnnouncement(new Announcement(null,"内容"+i,null,null));
        }
    }

    @Test
    public List<Announcement> find(){
        systemService.findAnnouncement(1,10).forEach(System.out::println);
        return systemService.findAnnouncement(1,10);
    }

    @Test
    public void delete(){
        systemService.deleteAnnouncement(find().stream().map(Announcement::getId).collect(Collectors.toList()));
    }

}
