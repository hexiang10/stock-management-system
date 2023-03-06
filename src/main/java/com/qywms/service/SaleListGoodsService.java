package com.qywms.service;

import com.qywms.entity.SaleListGoods;

import java.util.List;

/**
 * 销售单商品Service接口
 */
public interface SaleListGoodsService {

    /**
     * 根据销售单id查询所有销售单商品
     *
     * @param saleListId
     * @return
     */
    List<SaleListGoods> listBySaleListId(Integer saleListId);

    /**
     * 统计某个商品的销售总数
     *
     * @param goodsId
     * @return
     */
    Integer getTotalByGoodsId(Integer goodsId);

    /**
     * 根据条件查询销售单商品
     *
     * @param saleListGoods
     * @return
     */
    List<SaleListGoods> list(SaleListGoods saleListGoods);
}
