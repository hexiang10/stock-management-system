package com.qywms.service.impl;

import com.qywms.entity.PurchaseListGoods;
import com.qywms.repository.PurchaseListGoodsRepository;
import com.qywms.service.PurchaseListGoodsService;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

/**
 * 进货单商品Service实现类
 */
@Service("purchaseListGoodsService")
public class PurchaseListGoodsServiceImpl implements PurchaseListGoodsService {

    @Resource
    private PurchaseListGoodsRepository purchaseListGoodsRepository;

    /**
     * 根据进货单id查询所有进货单商品
     *
     * @param purchaseListId
     * @return
     */
    @Override
    public List<PurchaseListGoods> listByPurchaseListId(Integer purchaseListId) {
        return purchaseListGoodsRepository.listByPurchaseListId(purchaseListId);
    }

    @Override
    public List<PurchaseListGoods> list(PurchaseListGoods purchaseListGoods) {
        return purchaseListGoodsRepository.findAll(new Specification<PurchaseListGoods>() {
            @Override
            public Predicate toPredicate(Root<PurchaseListGoods> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
                Predicate predicate = criteriaBuilder.conjunction();
                if (purchaseListGoods != null) {
                    if (purchaseListGoods.getTypeId() != null) {
                        predicate.getExpressions().add(criteriaBuilder.equal(root.get("type"), purchaseListGoods.getType()));
                    }
                    if (purchaseListGoods.getCodeOrName() != null) {
                        predicate.getExpressions().add(criteriaBuilder.or(criteriaBuilder.like(root.get("code"), "%" + purchaseListGoods.getCodeOrName() + "%"), criteriaBuilder.like(root.get("name"), "%" + purchaseListGoods.getCodeOrName() + "%")));
                    }
                }
                return predicate;
            }
        });
    }
}
