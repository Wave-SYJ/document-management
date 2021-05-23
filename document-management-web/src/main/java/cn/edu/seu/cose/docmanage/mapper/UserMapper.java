package cn.edu.seu.cose.docmanage.mapper;

import cn.edu.seu.cose.docmanage.entity.Journal;
import cn.edu.seu.cose.docmanage.entity.Paper;
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
    Page<User> findUserPage(String searchKey, String searchValue);
    void insertUser(User user);
    void bindRoles(UUID userId, List<String> roleNames);
    void findRolesByUser(UUID userId);
    void deleteUsers(List<UUID> userIds);
    void updatePasswordByUserId(UUID userId, String encodedPassword);
    void deleteAllRoles(UUID userId);
    void updateUser(User user);


    Page<Paper> findUserCollectionPage(UUID userId);
    Page<Journal> findUserSubscriptionPage(UUID userId);


}
