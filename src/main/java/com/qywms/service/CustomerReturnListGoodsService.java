package com.qywms.service;

import com.qywms.entity.CustomerReturnListGoods;

import java.util.List;


public interface CustomerReturnListGoodsService {

    /**
     * 根据客户退货单id查询所有客户退货单商品
     *
     * @param customerReturnListId
     * @return
     */
    List<CustomerReturnListGoods> listByCustomerReturnListId(Integer customerReturnListId);

    /**
     * 统计某个商品的退货总数
     *
     * @param goodsId
     * @return
     */
    Integer getTotalByGoodsId(Integer goodsId);

    /**
     * 根据条件查询客户退货单商品
     *
     * @param customerReturnListGoods
     * @return
     */
    List<CustomerReturnListGoods> list(CustomerReturnListGoods customerReturnListGoods);
}
