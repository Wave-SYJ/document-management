package cn.edu.seu.cose.docmanage.service;

import cn.edu.seu.cose.docmanage.entity.Role;
import cn.edu.seu.cose.docmanage.entity.User;
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

    public Page<User> findUserPage(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return userMapper.findUserPage();
    }

}
