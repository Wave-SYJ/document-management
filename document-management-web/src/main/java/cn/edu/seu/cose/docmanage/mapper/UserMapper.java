package cn.edu.seu.cose.docmanage.mapper;

import cn.edu.seu.cose.docmanage.entity.Role;
import cn.edu.seu.cose.docmanage.entity.User;
import com.github.pagehelper.Page;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface UserMapper {
    User findUserByUsername(String username);
    List<User> findAllUsers();
    Page<User> findUserPage();
    void insertUser(User user);
    void bindRoles(UUID userId, List<String> roleNames);
    void findRolesByUser(UUID userId);

}
