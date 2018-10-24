package com.lym.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lym.dao.GroupDao;
import com.lym.entity.Group;
import com.lym.service.GroupService;

/**
 * 身份service实现类
 * @author ASUS
 *
 */
@Service("groupService")
public class GroupServieImpl  implements GroupService{


	@Resource
	private GroupDao groupDao;

	public List<Group> find(Map<String, Object> map) {
		return groupDao.find(map);
	}

	public Group findById(String id) {
		return groupDao.findById(id);
	}

	public Long getTotal(Map<String, Object> map) {
		return groupDao.getTotal(map);
	}

	public int delete(String id) {
		return groupDao.delete(id);
	}

	public int update(Group group) {
		return groupDao.update(group);
	}

	public int add(Group group) {
		return groupDao.add(group);
	}

	public List<Group> findByUserId(String userId) {
		// TODO Auto-generated method stub
		return groupDao.findByUserId(userId);
	}



}
