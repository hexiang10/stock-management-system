package com.qywms.service;

import com.qywms.entity.Log;

import java.util.List;

/**
 * 日志Service接口
 */
public interface LogService {
    /**
     * 添加或者修改日志信息
     *
     * @param log
     */
    void save(Log log);

    /**
     * 根据条件分页查询日志信息
     *
     * @param log
     * @param page
     * @param pageSize
     * @return
     */
    List<Log> list(Log log, Integer page, Integer pageSize);

    /**
     * 获取总记录数
     *
     * @param log
     * @return
     */
    Long getCount(Log log);
}
