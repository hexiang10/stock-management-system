package com.qywms.service;

import com.qywms.entity.OverflowListGoods;

import java.util.List;

/**
 * 商品报溢单商品Service接口
 */
public interface OverflowListGoodsService {

    /**
     * 根据商品报溢单id查询所有商品报溢单商品
     *
     * @param overflowListId
     * @return
     */
    List<OverflowListGoods> listByOverflowListId(Integer overflowListId);
}
