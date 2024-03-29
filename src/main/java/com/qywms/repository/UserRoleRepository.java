package com.qywms.repository;

import com.qywms.entity.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

/**
 * 用户角色关联Repository接口
 */
public interface UserRoleRepository extends JpaRepository<UserRole, Integer>, JpaSpecificationExecutor<UserRole> {

    /**
     * 根据用户id删除所有关联信息
     *
     * @param userId
     */
    @Query(value = "delete from t_user_role where user_id=?1", nativeQuery = true)
    @Modifying
    void deleteByUserId(Integer userId);

    /**
     * 根据角色id删除所有关联信息
     *
     * @param roleId
     */
    @Query(nativeQuery = true,value = "delete from t_user_role where role_id=?1")
    @Modifying
    void deleteByRoleId(Integer roleId);
}
