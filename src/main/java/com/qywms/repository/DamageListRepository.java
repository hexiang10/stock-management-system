package com.qywms.repository;

import com.qywms.entity.DamageList;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

/**
 * 商品报损单Repository接口
 */
public interface DamageListRepository extends JpaRepository<DamageList, Integer>, JpaSpecificationExecutor<DamageList> {

    /**
     * 获取当天最大商品报损单号
     *
     * @return
     */
    @Query(value = "select MAX(damage_number) from t_damage_list where to_days(damage_date)=to_days(now())", nativeQuery = true)
    String getTodayMaxDamageNumber();
}
