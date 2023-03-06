package com.qywms.service;

import com.qywms.entity.CustomerReturnList;
import com.qywms.entity.CustomerReturnListGoods;

import java.util.List;


public interface CustomerReturnListService {

    /**
     * 根据id查询实体
     *
     * @param id
     * @return
     */
    CustomerReturnList findById(Integer id);

    /**
     * 获取当天最大客户退货单号
     *
     * @return
     */
    String getTodayMaxCustomerReturnNumber();

    /**
     * 添加客户退货单 以及所有客户退货单商品  以及 修改 库存数量
     *
     * @param customerReturnList
     * @param customerReturnListGoodsList
     */
    void save(CustomerReturnList customerReturnList, List<CustomerReturnListGoods> customerReturnListGoodsList);

    /**
     * 根据条件查询客户退货单信息
     *
     * @param customerReturnList
     * @return
     */
    List<CustomerReturnList> list(CustomerReturnList customerReturnList);

    /**
     * 根据id删除客户退货单信息 包括客户退货单里的所有商品
     *
     * @param id
     */
    void delete(Integer id);

    /**
     * 更新客户退货单
     *
     * @param customerReturnList
     */
    void update(CustomerReturnList customerReturnList);
}

