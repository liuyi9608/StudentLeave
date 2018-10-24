package com.lym.service;

import java.util.List;
import java.util.Map;

import com.lym.entity.User;
/**
 * 用户service接口
 * @author ASUS
 *
 */
public interface UserService {
	/**
	 * 通过ID查找用户
	 * @param id
	 * @return
	 */
	public User findById(String id);
	
	/**
	 * 查找所有的用户
	 * @param map
	 * @return
	 */
	public List<User> find(Map<String, Object> map);
	
	/**
	 * 获得用户总数
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String, Object> map);
	
	/**
	 * 删除用户
	 * @param id
	 * @return
	 */
	public int delete(String id);
	
	/**
	 * 更新用户
	 * @param user
	 * @return
	 */
	public int update(User user);
	
	/**
	 * 增加用户
	 * @param user
	 * @return
	 */
	public int add(User user);
}
