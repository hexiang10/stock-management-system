package com.qywms.service.impl;

import com.qywms.entity.GoodsUnit;
import com.qywms.repository.GoodsUnitRepository;
import com.qywms.service.GoodsUnitService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 商品单位Service实现类
 */
@Service("goodsUnitService")
public class GoodsUnitServiceImpl implements GoodsUnitService {

    @Resource
    private GoodsUnitRepository goodsUnitRepository;

    /**
     * 查询所有商品单位信息
     *
     * @return
     */
    @Override
    public List<GoodsUnit> listAll() {
        return goodsUnitRepository.findAll();
    }

    /**
     * 添加或者修改商品单位信息
     *
     * @param goodsUnit
     */
    @Override
    public void save(GoodsUnit goodsUnit) {
        goodsUnitRepository.save(goodsUnit);
    }

    /**
     * 根据id删除商品单位
     *
     * @param id
     */
    @Override
    public void delete(Integer id) {
        goodsUnitRepository.deleteById(id);
    }

    /**
     * 根据id查询实体
     *
     * @param id
     * @return
     */
    @Override
    public GoodsUnit findById(Integer id) {
        return goodsUnitRepository.findById(id).get();
    }
}
