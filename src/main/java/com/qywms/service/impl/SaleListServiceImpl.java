package com.qywms.service.impl;

import com.qywms.entity.Goods;
import com.qywms.entity.SaleList;
import com.qywms.entity.SaleListGoods;
import com.qywms.repository.GoodsRepository;
import com.qywms.repository.GoodsTypeRepository;
import com.qywms.repository.SaleListGoodsRepository;
import com.qywms.repository.SaleListRepository;
import com.qywms.service.SaleListService;
import com.qywms.util.StringUtil;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.Date;
import java.util.List;

/**
 * 销售单Service实现类
 */
@Service("searchSaleListService")
@Transactional(rollbackFor = Exception.class)
public class SaleListServiceImpl implements SaleListService {

    @Resource
    private SaleListRepository saleListRepository;

    @Resource
    private GoodsTypeRepository goodsTypeRepository;

    @Resource
    private GoodsRepository goodsRepository;

    @Resource
    private SaleListGoodsRepository saleListGoodsRepository;

    @Override
    public String getTodayMaxSaleNumber() {
        return saleListRepository.getTodayMaxSaleNumber();
    }

    @Override
    public void save(SaleList searchSaleList, List<SaleListGoods> searchSaleListGoodsList) {
        for (SaleListGoods searchSaleListGoods : searchSaleListGoodsList) {
            //设置类别
            searchSaleListGoods.setType(goodsTypeRepository.findById(searchSaleListGoods.getTypeId()).get());
            //设置销售单
            searchSaleListGoods.setSaleList(searchSaleList);
            saleListGoodsRepository.save(searchSaleListGoods);
            // 修改商品库存
            Goods goods = goodsRepository.findById(searchSaleListGoods.getGoodsId()).get();
            goods.setInventoryQuantity(goods.getInventoryQuantity() - searchSaleListGoods.getNum());
            goods.setLastPurchasingPrice(searchSaleListGoods.getPrice());
            goods.setState(2);
            goodsRepository.save(goods);
        }
        searchSaleList.setSaleDate(new Date());
        saleListRepository.save(searchSaleList);
    }

    @Override
    public List<SaleList> list(SaleList saleList) {
        return saleListRepository.findAll(new Specification<SaleList>() {
            @Override
            public Predicate toPredicate(Root<SaleList> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                Predicate predicate = cb.conjunction();
                if (saleList != null) {
                    if (StringUtil.isNotEmpty(saleList.getSaleNumber())) {
                        predicate.getExpressions().add(cb.like(root.get("saleNumber"), "%" + saleList.getSaleNumber().trim() + "%"));
                    }
                    if (saleList.getCustomer() != null && saleList.getCustomer().getId() != null) {
                        predicate.getExpressions().add(cb.equal(root.get("customer").get("id"), saleList.getCustomer().getId()));
                    }
                    if (saleList.getState() != null) {
                        predicate.getExpressions().add(cb.equal(root.get("state"), saleList.getState()));
                    }
                    if (saleList.getbSaleDate() != null) {
                        predicate.getExpressions().add(cb.greaterThanOrEqualTo(root.get("saleDate"), saleList.getbSaleDate()));
                    }
                    if (saleList.geteSaleDate() != null) {
                        predicate.getExpressions().add(cb.lessThanOrEqualTo(root.get("saleDate"), saleList.geteSaleDate()));
                    }
                }
                return predicate;
            }
        });
    }

    @Override
    public SaleList findById(Integer saleId) {
        return saleListRepository.findById(saleId).get();
    }

    @Override
    public void delete(Integer id) {
        saleListGoodsRepository.deleteBySaleListId(id);
        saleListRepository.deleteById(id);
    }

    @Override
    public void update(SaleList saleList) {
        saleListRepository.save(saleList);
    }

    @Override
    public List<Object> countSaleByDay(String begin, String end) {
        return saleListRepository.countSaleByDay(begin, end);
    }

    @Override
    public List<Object> countSaleByMonth(String begin, String end) {
        return saleListRepository.countSaleByMonth(begin, end);
    }
}
