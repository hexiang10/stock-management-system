package com.qywms.repository;

import com.qywms.entity.Menu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * 菜单Repository接口
 */
public interface MenuRepository extends JpaRepository<Menu, Integer> {

    /**
     * 根据父节点以及用户角色id查询子节点
     *
     * @param parentId
     * @param roleId
     * @return
     */
    @Query(nativeQuery = true, value = "select * from t_menu where p_id=?1 and id in (select menu_id from t_role_menu where role_id=?2)")
    List<Menu> findByParentIdAndRoleId(Integer parentId, Integer roleId);

    /**
     * 根据角色id获取菜单集合
     *
     * @param roleId
     * @return
     */
    @Query(nativeQuery = true, value = "select m.* from t_role r ,t_role_menu rm ,t_menu m where rm.role_id=r.id and rm.menu_id=m.id and r.id=?1")
    List<Menu> findByRoleId(Integer roleId);

    /**
     * 根据父节点查找所有子节点
     *
     * @param parentId
     * @return
     */
    @Query(value="select * from t_menu where p_id=?1",nativeQuery=true)
    List<Menu> findByParentId(Integer parentId);
}
