package cn.edu.seu.cose.docmanage.mapper;

import cn.edu.seu.cose.docmanage.entity.Role;
import cn.edu.seu.cose.docmanage.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DemoMapper {

    List<Role> selectAllRoles();
    void insertUser(User user);

}
