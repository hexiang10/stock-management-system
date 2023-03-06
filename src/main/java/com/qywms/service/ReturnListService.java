package com.qywms.service;

import com.qywms.entity.ReturnList;
import com.qywms.entity.ReturnListGoods;

import java.util.List;

/**
 * 退货单Service接口
 */
public interface ReturnListService {

    /**
     * 获取当天最大退货单号
     *
     * @return
     */
    String getTodayMaxReturnNumber();

    /**
     * 添加退货单 以及所有退货单商品  以及 修改商品成本价 库存数量 上次进价
     *
     * @param returnList
     * @param returnListGoodsList
     */
    void save(ReturnList returnList, List<ReturnListGoods> returnListGoodsList);

    /**
     * 根据条件查询退货单信息
     *
     * @param returnList
     * @return
     */
    List<ReturnList> list(ReturnList returnList);

    /**
     * 根据id查询实体
     *
     * @param returnId
     * @return
     */
    ReturnList findById(Integer returnId);

    /**
     * 根据id删除退货单信息 包括退货单里的所有商品
     *
     * @param id
     */
    void delete(Integer id);

    /**
     * 更新退货单
     *
     * @param returnList
     */
    void update(ReturnList returnList);
}
