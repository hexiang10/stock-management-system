package com.qywms.service;

import com.qywms.entity.Supplier;

import java.util.List;

/**
 * 供应商Service接口
 */
public interface SupplierService {

    /**
     * 根据名称模糊查询供应商信息
     *
     * @param name
     * @return
     */
    List<Supplier> findByName(String name);

    /**
     * 根据条件分页查询供应商信息
     *
     * @param supplier
     * @param page
     * @param pageSize
     * @return
     */
    List<Supplier> list(Supplier supplier, Integer page, Integer pageSize);

    /**
     * 获取总记录数
     *
     * @param supplier
     * @return
     */
    Long getCount(Supplier supplier);

    /**
     * 添加或者修改供应商信息
     *
     * @param supplier
     */
    void save(Supplier supplier);

    /**
     * 根据id删除供应商
     *
     * @param id
     */
    void delete(Integer id);

    /**
     * 根据id查询实体
     *
     * @param id
     * @return
     */
    Supplier findById(Integer id);
}
