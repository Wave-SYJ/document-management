package cn.edu.seu.cose.docmanage.SyjTest;

import cn.edu.seu.cose.docmanage.entity.Paper;
import cn.edu.seu.cose.docmanage.service.PaperService;
import cn.edu.seu.cose.docmanage.service.UserService;
import com.github.pagehelper.Page;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class SystemTest {

    @Autowired
    private PaperService paperService;

    @Autowired
    private UserService userService;

    @Test
    public void test() {
        Page<Paper> paperPage = paperService.findPaperPage(1, 10, null, null);
    }

}
