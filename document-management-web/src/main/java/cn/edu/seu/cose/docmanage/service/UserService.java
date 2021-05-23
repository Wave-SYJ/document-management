package cn.edu.seu.cose.docmanage.service;

import cn.edu.seu.cose.docmanage.entity.Journal;
import cn.edu.seu.cose.docmanage.entity.Paper;
import cn.edu.seu.cose.docmanage.entity.Role;
import cn.edu.seu.cose.docmanage.entity.User;
import cn.edu.seu.cose.docmanage.exception.SimpleException;
import cn.edu.seu.cose.docmanage.mapper.UserMapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        User user = userMapper.findUserByUsername(s);
        if (user == null)
            throw new UsernameNotFoundException("用户不存在");
        return user;
    }

    @Transactional
    public void insertUser(User user) {
        if (user.getId() == null)
            user.setId(UUID.randomUUID());
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userMapper.insertUser(user);

        if (user.getRoles() == null || user.getRoles().size() == 0)
            return;
        userMapper.bindRoles(user.getId(), user.getRoles().stream().map(Role::getName).collect(Collectors.toList()));
    }

    public Page<User> findUserPage(int pageNum, int pageSize, String searchKey, String searchValue) {
        PageHelper.startPage(pageNum, pageSize);
        return userMapper.findUserPage(searchKey, searchValue);
    }

    public void deleteUsers(List<UUID> ids) {
        userMapper.deleteUsers(ids);
    }

    public List<String> findUsernameByIds(List<UUID> ids) {
        if (ids == null || ids.isEmpty())
            return null;
        return userMapper.findUsernameByIds(ids);
    }

    public void changePassword(User user, String oldPassword, String newPassword, String repeatPassword) {
        if (user == null || oldPassword == null || newPassword == null || repeatPassword == null)
            throw new SimpleException("旧密码/新密码/重复密码不能为空");
        if (!newPassword.equals(repeatPassword))
            throw new SimpleException("旧密码需要和新密码相同");
        if (!passwordEncoder.matches(oldPassword, user.getPassword()))
            throw new SimpleException("旧密码错误");
        userMapper.updatePasswordByUserId(user.getId(), passwordEncoder.encode(newPassword));
    }

    public void register(User user) {
        if (!StringUtils.hasText(user.getUsername()))
            throw new SimpleException("用户名不能为空");
        if (!StringUtils.hasText(user.getPassword()))
            throw new SimpleException("密码不能为空");
        insertUser(user);
    }

    @Transactional
    public void updateUser(User user) {
        if (user.getId() == null)
            throw new SimpleException("请指定用户");
        if (user.getUsername() == null)
            throw new SimpleException("用户名不能为空");
        if (user.getPassword() == null)
            throw new SimpleException("密码不能为空");
        userMapper.deleteAllRoles(user.getId());
        userMapper.updateUser(user);
        if (user.getRoles() == null || user.getRoles().size() == 0)
            return;
        userMapper.bindRoles(user.getId(), user.getRoles().stream().map(Role::getName).collect(Collectors.toList()));
    }


    public Page<Paper> findUserCollectionPage(UUID userId, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return userMapper.findUserCollectionPage(userId);
    }

    public void cancelCollection(UUID userId, List<UUID> paperIds){
        if(paperIds==null || userId == null)
            return;
        userMapper.cancelCollection(userId, paperIds);
    }

    public Page<Journal> findUserSubscriptionPage(UUID userId, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return userMapper.findUserSubscriptionPage(userId);

    }

    public void deleteSubscriptions(List<UUID> ids,UUID userId) {
        userMapper.deleteSubscriptions(ids,userId);
    }
}
