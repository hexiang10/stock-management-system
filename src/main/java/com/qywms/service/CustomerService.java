package com.qywms.service;

import com.qywms.entity.Customer;

import java.util.List;

/**
 * 客户Service接口
 */
public interface CustomerService {

    /**
     * 根据条件分页查询客户信息
     *
     * @param customer
     * @param page
     * @param pageSize
     * @return
     */
    List<Customer> list(Customer customer, Integer page, Integer pageSize);

    /**
     * 获取总记录数
     *
     * @param customer
     * @return
     */
    Long getCount(Customer customer);

    /**
     * 添加或者修改客户信息
     *
     * @param customer
     */
    void save(Customer customer);

    /**
     * 根据id删除客户
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
    Customer findById(Integer id);

    /**
     * 根据名称模糊查询客户信息
     * @param name
     * @return
     */
    List<Customer> findByName(String name);
}
