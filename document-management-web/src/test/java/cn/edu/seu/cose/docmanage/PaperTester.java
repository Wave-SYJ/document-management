package cn.edu.seu.cose.docmanage;

import cn.edu.seu.cose.docmanage.constants.RoleConstants;
import cn.edu.seu.cose.docmanage.entity.Paper;
import cn.edu.seu.cose.docmanage.entity.Role;
import cn.edu.seu.cose.docmanage.entity.User;
import cn.edu.seu.cose.docmanage.mapper.PaperMapper;
import cn.edu.seu.cose.docmanage.service.PaperService;
import com.github.pagehelper.Page;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.*;

@SpringBootTest
public class PaperTester {

    @Autowired
    private PaperMapper paperMapper;
    @Autowired
    private PaperService paperService;

    private final Random random = new Random();
    public String getRandomString(int length) {
        String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(62);
            sb.append(str.charAt(number));
        }
        return sb.toString();
    }



    @Test
    void test1() {
        for (int i = 0; i < 100; i++) {
            String name = getRandomString(5);
            Paper paper = new Paper(UUID.randomUUID(),name,name,name,new Date(),name,name,null);
            paperService.insetPaper(paper);
        }
    }

    private UUID uuid(String str) {
        if (str == null || str.length() < 32)
            return null;
        return UUID.fromString(
                String.format("%s-%s-%s-%s-%s",
                        str.substring(0, 8),
                        str.substring(8, 12),
                        str.substring(12, 16),
                        str.substring(16, 20),
                        str.substring(20, 32))
        );
    }

    @Test
    void test2() {
        UUID uuid = UUID.randomUUID();
        Paper paper1 = new Paper(uuid,"scy","scy","scy",new Date(),"scy","scy",null);
        paperService.insetPaper(paper1);


    }
    @Test
    void test3(){

        Paper paper1 = new Paper(uuid("08e5e2f35a7b4a72b8e71029bdd34405"),"s","s","s",new Date(),"s","s",null);
        paperService.updatePaper(paper1);
    }


}
