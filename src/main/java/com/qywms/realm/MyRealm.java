package com.qywms.realm;

import com.qywms.entity.Menu;
import com.qywms.entity.Role;
import com.qywms.entity.User;
import com.qywms.repository.MenuRepository;
import com.qywms.repository.RoleRepository;
import com.qywms.repository.UserRepository;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import javax.annotation.Resource;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 自定义Realm
 */
public class MyRealm extends AuthorizingRealm {

    @Resource
    private UserRepository userRepository;

    @Resource
    private RoleRepository roleRepository;

    @Resource
    private MenuRepository menuRepository;

    /**
     * 授权
     *
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        String userName = SecurityUtils.getSubject().getPrincipal().toString();
        User user = userRepository.findByUserName(userName);
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        List<Role> roleList = roleRepository.findByUserId(user.getId());
        Set<String> roles = new HashSet<>();
        for (Role role : roleList) {
            //获取一个角色
            roles.add(role.getName());
            //这个角色的权限菜单
            List<Menu> menuList = menuRepository.findByRoleId(role.getId());
            for (Menu menu : menuList) {
                info.addStringPermission(menu.getName());
            }
        }
        //获得该用户的所有角色
        info.setRoles(roles);
        return info;
    }

    /**
     * 身份权限认证
     *
     * @param token
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String userName = token.getPrincipal().toString();
        User user = userRepository.findByUserName(userName);
        if (user != null) {
            AuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(user.getUserName(), user.getPassword(), "xxx");
            return authenticationInfo;
        } else {
            return null;
        }
    }
}
