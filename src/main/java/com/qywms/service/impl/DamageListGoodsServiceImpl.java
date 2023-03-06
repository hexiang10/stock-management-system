package com.qywms.service.impl;

import com.qywms.entity.DamageListGoods;
import com.qywms.repository.DamageListGoodsRepository;
import com.qywms.service.DamageListGoodsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 商品报损单商品Service实现类
 */
@Service("damageListGoodsService")
public class DamageListGoodsServiceImpl implements DamageListGoodsService {

    @Resource
    private DamageListGoodsRepository damageListGoodsRepository;

    /**
     * 根据商品报损单id查询所有商品报损单商品
     *
     * @param damageListId
     * @return
     */
    @Override
    public List<DamageListGoods> listByDamageListId(Integer damageListId) {
        return damageListGoodsRepository.listByDamageListId(damageListId);
    }
}
