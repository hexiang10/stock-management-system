package com.qywms.service.impl;

import com.qywms.entity.User;
import com.qywms.repository.UserRepository;
import com.qywms.service.UserService;
import com.qywms.util.StringUtil;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

/**
 * 用户Service实现类
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    @Resource
    private UserRepository userRepository;

    /**
     * 根据用户名查找用户实体
     *
     * @param userName
     * @return
     */
    @Override
    public User findByUserName(String userName) {
        return userRepository.findByUserName(userName);
    }

    /**
     * 根据条件分页查询用户信息
     *
     * @param user
     * @param page
     * @param pageSize
     * @return
     */
    @Override
    public List<User> list(User user, Integer page, Integer pageSize) {
        Pageable pageable = PageRequest.of(page - 1, pageSize, Sort.Direction.ASC, "id");
        Page<User> userPage = userRepository.findAll(new Specification<User>() {
            @Override
            public Predicate toPredicate(Root<User> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Predicate predicate = criteriaBuilder.conjunction();
                if (user != null) {
                    if (StringUtil.isNotEmpty(user.getUserName())) {
                        predicate.getExpressions().add(criteriaBuilder.like(root.get("userName"), "%" + user.getUserName() + "%"));
                    }
                    predicate.getExpressions().add(criteriaBuilder.notEqual(root.get("id"), 1));
                }
                return predicate;
            }
        }, pageable);
        return userPage.getContent();
    }

    /**
     * 获取总记录数
     *
     * @param user
     * @return
     */
    @Override
    public Long getCount(User user) {
        Long count = userRepository.count(new Specification<User>() {
            @Override
            public Predicate toPredicate(Root<User> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Predicate predicate = criteriaBuilder.conjunction();
                if (user != null) {
                    if (StringUtil.isNotEmpty(user.getUserName())) {
                        predicate.getExpressions().add(criteriaBuilder.like(root.get("userName"), "%" + user.getUserName() + "%"));
                    }
                    predicate.getExpressions().add(criteriaBuilder.notEqual(root.get("id"), 1));
                }
                return predicate;
            }
        });
        return count;
    }

    /**
     * 添加或者修改用户信息
     *
     * @param user
     */
    @Override
    public void save(User user) {
        userRepository.save(user);
    }

    /**
     * 根据id删除用户
     *
     * @param userId
     */
    @Override
    public void delete(Integer userId) {
        userRepository.deleteById(userId);
    }

    /**
     * 根据id查询实体
     *
     * @param userId
     * @return
     */
    @Override
    public User findById(Integer userId) {
        return userRepository.findById(userId).get();
    }
}
