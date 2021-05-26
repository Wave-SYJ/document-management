package cn.edu.seu.cose.docmanage;

import cn.edu.seu.cose.docmanage.constants.RoleConstants;
import cn.edu.seu.cose.docmanage.entity.Journal;
import cn.edu.seu.cose.docmanage.entity.Paper;
import cn.edu.seu.cose.docmanage.entity.Role;
import cn.edu.seu.cose.docmanage.entity.User;
import cn.edu.seu.cose.docmanage.mapper.JournalMapper;
import cn.edu.seu.cose.docmanage.service.PaperService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import cn.edu.seu.cose.docmanage.mapper.JournalMapper;
import cn.edu.seu.cose.docmanage.mapper.UserMapper;
import cn.edu.seu.cose.docmanage.service.JournalService;
import cn.edu.seu.cose.docmanage.service.UserService;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.UUID;

@SpringBootTest
@Slf4j
public class JournalTester {

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

    @Autowired
    private JournalMapper journalMapper;

    @Autowired
    private UserService userService;

    @Autowired
    private JournalService journalService;

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
    public void insertTestJournal() {
        Journal newJournal = new Journal(UUID.randomUUID(), "abab", "lr", null, "english", "111");
        journalMapper.insertJournal(newJournal);
    }

    @Test
    public void printJournal(){
        journalMapper.findJournalPage("","").forEach((item)->{
            System.out.println(item);
        });
    }

    @Test
    public void getAJournalById(){
        System.out.println(journalMapper.findJournalById(UUID.fromString("4929e372-86a1-456c-9541-f6941b0e8965")));
    }

    @Test
    public void insertSubscription(){
        String name = getRandomString(5);
        List<Role> roles = new ArrayList<>();
        User user = new User(UUID.randomUUID(), name, name, roles);
        userService.insertUser(user);

        Journal newjournal=new Journal(UUID.randomUUID(),name,name,name,null,name);
        journalService.insertJournal(newjournal);

        journalService.insertSubscription(user.getId(),newjournal.getId());


    }

    @Test
    public void ifSubscribed(){

        String name = getRandomString(5);
        List<Role> roles = new ArrayList<>();
        User user = new User(UUID.randomUUID(), name, name, roles);

        Journal newjournal=new Journal(UUID.randomUUID(),name,name,name,null,name);

        if(!journalService.ifSubscribed(user.getId(),newjournal.getId()))
            log.info("true");

    }
}
