package com.qywms.repository;

import com.qywms.entity.Log;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * 系统日志Repository接口
 */
public interface LogRepository extends JpaRepository<Log,Integer>, JpaSpecificationExecutor<Log> {
}
