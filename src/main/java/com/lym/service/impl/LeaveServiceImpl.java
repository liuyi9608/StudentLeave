package com.lym.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lym.dao.LeaveDao;
import com.lym.entity.Leave;
import com.lym.service.LeaveService;

@Service("leaveService")
public class LeaveServiceImpl implements LeaveService {


    @Resource
    private LeaveDao leaveDao;

    public List<Leave> find(Map<String, Object> map) {
        return leaveDao.find(map);
    }

    public Long getTotal(Map<String, Object> map) {
        return leaveDao.getTotal(map);
    }

    public int add(Leave leave) {
        return leaveDao.add(leave);
    }

    public Leave findById(Integer id) {
        return leaveDao.findById(id);
    }

    public int update(Leave leave) {
        return leaveDao.update(leave);
    }


}
