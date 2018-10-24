package com.lym.service;

import java.util.List;
import java.util.Map;

import com.lym.entity.Group;

/**
 * 身份service接口
 *
 * @author ASUS
 */
public interface GroupService {
    public List<Group> find(Map<String, Object> map);

    /**
     * 通过ID查找身份
     *
     * @param id
     * @return
     */
    public Group findById(String id);

    /**
     * 获得身份总数
     *
     * @param map
     * @return
     */
    public Long getTotal(Map<String, Object> map);

    /**
     * 删除身份
     *
     * @param id
     * @return
     */
    public int delete(String id);

    /**
     * 更新身份
     *
     * @param group
     * @return
     */
    public int update(Group group);

    /**
     * 增加身份
     *
     * @param group
     * @return
     */
    public int add(Group group);

    /**
     * 通过用户Id查找用户的身份信息
     *
     * @param userId
     * @return
     */
    public List<Group> findByUserId(String userId);
}
