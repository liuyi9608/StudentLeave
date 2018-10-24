package com.lym.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lym.dao.MemberShipDao;
import com.lym.entity.MemberShip;
import com.lym.service.MemberShipService;

/**
 * 身份service实现类
 *
 * @author ASUS
 */
@Service("memberShipService")
public class MemberShipServieImpl implements MemberShipService {

    @Resource
    private MemberShipDao memberShipDao;


    public MemberShip login(Map<String, Object> map) {
        return memberShipDao.login(map);
    }


    public int deleteAllGroupsByUserId(String userId) {
        return memberShipDao.deleteAllGroupsByUserId(userId);
    }


    public int add(MemberShip memberShip) {
        return memberShipDao.add(memberShip);
    }


}
