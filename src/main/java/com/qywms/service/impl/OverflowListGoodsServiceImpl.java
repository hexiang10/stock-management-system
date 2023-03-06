package com.qywms.service.impl;

import com.qywms.entity.OverflowListGoods;
import com.qywms.repository.OverflowListGoodsRepository;
import com.qywms.service.OverflowListGoodsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 商品报溢单商品Service实现类
 */
@Service("overflowListGoodsService")
public class OverflowListGoodsServiceImpl implements OverflowListGoodsService {

    @Resource
    private OverflowListGoodsRepository overflowListGoodsRepository;

    /**
     * 根据商品报溢单id查询所有商品报溢单商品
     *
     * @param overflowListId
     * @return
     */
    @Override
    public List<OverflowListGoods> listByOverflowListId(Integer overflowListId) {
        return overflowListGoodsRepository.listByOverflowListId(overflowListId);
    }
}
