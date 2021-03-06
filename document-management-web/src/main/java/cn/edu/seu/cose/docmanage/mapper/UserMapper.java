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
    User findUserById(UUID userId);
    Page<User> findUserPage(String searchKey, String searchValue);
    void insertUser(User user);
    void bindRoles(UUID userId, List<String> roleNames);
    List<Role> findRolesByUser(UUID userId);
    void deleteUsers(List<UUID> userIds);
    void updatePasswordByUserId(UUID userId, String encodedPassword);
    void deleteAllRoles(UUID userId);
    void updateUser(User user);


    Page<Paper> findUserCollectionPage(UUID userId);
    Page<Journal> findUserSubscriptionPage(UUID userId);

    void cancelCollection(UUID userId, List<UUID> paperIds);
    void addCollection(UUID id,UUID userId, UUID paperIds);
    void deleteCollection(UUID userId, UUID paperIds);
    Paper isCollected(UUID userId,UUID paperIds);



    void deleteSubscriptions(List<UUID> journalIds,UUID userId);
    List<String> findUsernameByIds(List<UUID> userIds);
}
