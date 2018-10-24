package com.lym.dao;

import java.util.Map;

import com.lym.entity.MemberShip;
import com.lym.entity.User;
import com.mysql.fabric.xmlrpc.base.Member;

/**
 * 登陆
 * @author ASUS
 *
 */
public interface MemberShipDao {
	
	/**
	 * 查找所有的身份
	 * @param map
	 * @return
	 */
	public MemberShip login(Map<String, Object> map);
	
	
	/**
	 * 通过用户ID删除用户的所有身份
	 * @param userId
	 * @return
	 */
	public int deleteAllGroupsByUserId(String userId);
	
	/**
	 * 给用户添加身份信息
	 * @param memberShip
	 * @return
	 */
	public int add(MemberShip memberShip);
}
