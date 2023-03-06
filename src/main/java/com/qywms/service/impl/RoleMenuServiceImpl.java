package com.qywms.service.impl;

import com.qywms.entity.RoleMenu;
import com.qywms.repository.RoleMenuRepository;
import com.qywms.service.RoleMenuService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * 角色菜单关联Service实现类
 */
@Service("roleMenuService")
@Transactional(rollbackFor = Exception.class)
public class RoleMenuServiceImpl implements RoleMenuService {

    @Resource
    private RoleMenuRepository roleMenuRepository;

    /**
     * 根据角色id删除所有关联信息
     *
     * @param roleId
     */
    @Override
    public void deleteByRoleId(Integer roleId) {
        roleMenuRepository.deleteByRoleId(roleId);
    }

    @Override
    public void save(RoleMenu roleMenu) {
        roleMenuRepository.save(roleMenu);
    }
}
