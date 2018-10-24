package com.lym.dao;

import java.util.List;
import java.util.Map;

import com.lym.entity.Leave;

/**
 * 请假单的Dao
 * @author ASUS
 *
 */
public interface LeaveDao {
	
	
	/**
	 * 查找所有的请假单
	 * @param map
	 * @return
	 */
	public List<Leave> find(Map<String, Object> map);
	
	/**
	 * 获得请假单总数
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String, Object> map);
	
	/**
	 * 添加请假单
	 * @param leave
	 * @return
	 */
	public int add(Leave leave);

	/**
	 * 通过请假单ID找到请假单
	 * @param id
	 * @return
	 */
	public Leave findById(Integer id);

	/**
	 * 修改请假单
	 * @param leave
	 * @return
	 */
	public int update(Leave leave);
	
}
