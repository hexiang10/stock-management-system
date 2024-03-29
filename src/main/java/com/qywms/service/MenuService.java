package com.qywms.service;

import com.qywms.entity.Menu;

import java.util.List;

/**
 * 权限菜单Service接口
 */
public interface MenuService {

    /**
     * 根据父节点以及用户角色id查询子节点
     *
     * @param parentId
     * @param roleId
     * @return
     */
    List<Menu> findByParentIdAndRoleId(Integer parentId, Integer roleId);

    /**
     * 根据父节点查找所有子节点
     *
     * @param parentId
     * @return
     */
    List<Menu> findByParentId(int parentId);

    /**
     * 根据角色id获取菜单集合
     *
     * @param roleId
     * @return
     */
    List<Menu> findByRoleId(Integer roleId);

    /**
     * 根据id获取实体
     *
     * @param id
     * @return
     */
    Menu findById(Integer id);
}
