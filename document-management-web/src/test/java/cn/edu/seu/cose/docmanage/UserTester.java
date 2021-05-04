package cn.edu.seu.cose.docmanage;

import cn.edu.seu.cose.docmanage.constants.RoleConstants;
import cn.edu.seu.cose.docmanage.entity.Role;
import cn.edu.seu.cose.docmanage.entity.User;
import cn.edu.seu.cose.docmanage.mapper.UserMapper;
import cn.edu.seu.cose.docmanage.service.UserService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.UUID;
import java.util.logging.ConsoleHandler;

@SpringBootTest
public class UserTester {

    @Autowired
    private UserService userService;

    private final Random random = new Random()
;
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
    public void insertTestUsers() {
        for (int i = 0; i < 100; i++) {
            String name = getRandomString(5);
            List<Role> roles = new ArrayList<>();
            User user = new User(UUID.randomUUID(), name, name, roles);
            if (random.nextInt(3) == 0)
                roles.add(new Role(RoleConstants.ROLE_DOCUMENT_ADMIN));
            if (random.nextInt(3) == 0)
                roles.add(new Role(RoleConstants.ROLE_USER_ADMIN));
            if (random.nextInt(3) == 0)
                roles.add(new Role(RoleConstants.ROLE_SYSTEM_ADMIN));
            userService.insertUser(user);
        }
    }

}
