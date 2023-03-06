package com.qywms.service;

import com.qywms.entity.DamageListGoods;

import java.util.List;

/**
 * 商品报损单商品Service接口
 */
public interface DamageListGoodsService {

    /**
     * 根据商品报损单id查询所有商品报损单商品
     *
     * @param damageListId
     * @return
     */
    List<DamageListGoods> listByDamageListId(Integer damageListId);
}
