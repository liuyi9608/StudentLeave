package com.lym.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lym.entity.Group;
import com.lym.entity.MemberShip;
import com.lym.entity.User;
import com.lym.service.MemberShipService;
import com.lym.util.ResponseUtil;
import com.lym.util.StringUtil;

import net.sf.json.JSONObject;

/**
 * 用户关联membership controller
 *
 * @author ASUS
 */
@Controller
@RequestMapping("/memberShip")
public class MemberShipController {

    @Resource
    private MemberShipService memberShipService;

    @RequestMapping("/update")
    public String update(String userId, String groupIds, HttpServletResponse response) throws Exception {
        memberShipService.deleteAllGroupsByUserId(userId);
        if (StringUtil.isNotEmpty(groupIds)) {
            String ids[] = groupIds.split(",");
            for (String groupId : ids) {
                User user = new User();
                user.setId(userId);
                Group group = new Group();
                group.setId(groupId);
                MemberShip memberShip = new MemberShip();
                memberShip.setGroup(group);
                memberShip.setUser(user);
                memberShipService.add(memberShip);
            }
        }
        JSONObject result = new JSONObject();
        result.put("success", true);
        ResponseUtil.write(response, result);
        return null;
    }

}
