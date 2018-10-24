package com.lym.service;

import java.util.Map;

import com.lym.entity.MemberShip;
/**
 * 登陆service接口
 * @author ASUS
 *
 */
public interface MemberShipService {
		
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
