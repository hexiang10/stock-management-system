package com.qywms.repository;

import com.qywms.entity.CustomerReturnListGoods;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * 客户退货单商品Repository接口
 */
public interface CustomerReturnListGoodsRepository extends JpaRepository<CustomerReturnListGoods, Integer>, JpaSpecificationExecutor<CustomerReturnListGoods> {

    /**
     * 根据客户退货单id查询所有客户退货单商品
     *
     * @param customerReturnListId
     * @return
     */
    @Query(value = "SELECT * FROM t_customer_return_list_goods WHERE customer_return_list_id=?1", nativeQuery = true)
    List<CustomerReturnListGoods> listByCustomerReturnListId(Integer customerReturnListId);

    /**
     * 根据客户退货单id删除所有客户退货单商品
     *
     * @param customerReturnListId
     * @return
     */
    @Query(value = "delete FROM t_customer_return_list_goods WHERE customer_return_list_id=?1", nativeQuery = true)
    @Modifying
    void deleteByCustomerReturnListId(Integer customerReturnListId);

    /**
     * 统计某个商品的退货总数
     *
     * @param goodsId
     * @return
     */
    @Query(value = "select sum(num) as total from t_customer_return_list_goods where goods_id=?1",nativeQuery = true)
    Integer getTotalByGoodsId(Integer goodsId);
}
