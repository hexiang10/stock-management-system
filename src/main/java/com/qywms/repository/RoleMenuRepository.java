package com.qywms.repository;

import com.qywms.entity.RoleMenu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

/**
 * 角色菜单关联Repository接口
 */
public interface RoleMenuRepository extends JpaRepository<RoleMenu, Integer>, JpaSpecificationExecutor<RoleMenu> {

    /**
     * 根据角色id删除所有关联信息
     *
     * @param roleId
     */
    @Query(nativeQuery = true,value = "delete from t_role_menu where role_id=?1")
    @Modifying
    void deleteByRoleId(Integer roleId);
}
