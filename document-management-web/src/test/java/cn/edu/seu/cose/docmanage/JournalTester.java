package cn.edu.seu.cose.docmanage;

import cn.edu.seu.cose.docmanage.constants.RoleConstants;
import cn.edu.seu.cose.docmanage.entity.Journal;
import cn.edu.seu.cose.docmanage.entity.Role;
import cn.edu.seu.cose.docmanage.entity.User;
import cn.edu.seu.cose.docmanage.mapper.JournalMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.UUID;

@SpringBootTest
public class JournalTester {

    @Autowired
    private JournalMapper journalMapper;

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
        Journal newJournal = new Journal(UUID.randomUUID(),"abab","lr",null,"english","111");
        journalMapper.insertJournal(newJournal);
    }


}
