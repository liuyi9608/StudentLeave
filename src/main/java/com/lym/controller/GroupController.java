package com.lym.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lym.entity.Group;
import com.lym.service.GroupService;
import com.lym.util.PageBean;
import com.lym.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 身份controller
 *
 * @author ASUS
 */
@Controller
@RequestMapping("/group")
public class GroupController {

    @Resource
    private GroupService groupService;

    /**
     * 查询所有的身份信息并显示到下拉框
     *
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/groupComboList")
    public String groupComboList(HttpServletResponse response) throws Exception {

        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("id", -1);
        jsonObject.put("name", "请选择角色...");
        jsonArray.add(jsonObject);

        List<Group> groupList = groupService.find(null);
        JSONArray rows = JSONArray.fromObject(groupList);
        jsonArray.addAll(rows);
        ResponseUtil.write(response, jsonArray);
        return null;
    }

    /**
     * 根据条件分页查询所有身份信息
     *
     * @param page
     * @param rows
     * @param s_group
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    public String list(@RequestParam(value = "page", required = false) String page,
                       @RequestParam(value = "rows", required = false) String rows,
                       HttpServletResponse response) throws Exception {
        PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
        //设置查询条件
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("start", pageBean.getStart());
        map.put("size", pageBean.getPageSize());

        List<Group> groupList = groupService.find(map);
        Long total = groupService.getTotal(map);
        JSONObject result = new JSONObject();
        JSONArray jsonArray = JSONArray.fromObject(groupList);
        //easyUI需要的数据
        result.put("rows", jsonArray); //获得记录数
        result.put("total", total); //获得总数
        ResponseUtil.write(response, result);
        return null;
    }

    /**
     * 删除身份可多选
     *
     * @param ids
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/delete")
    public String delete(@RequestParam(value = "ids", required = false) String ids,
                         HttpServletResponse response) throws Exception {
        String[] id = ids.split(",");
        for (int i = 0; i < id.length; i++) {
            groupService.delete(id[i]);
        }
        JSONObject result = new JSONObject();
        result.put("success", true);
        ResponseUtil.write(response, result);
        return null;
    }

    @RequestMapping("/save")
    public String save(Group group, HttpServletResponse response, Integer flag) throws Exception {
        int resultTotal = 0;
        if (flag == 1) {
            resultTotal = groupService.add(group);
        } else {
            resultTotal = groupService.update(group);
        }
        JSONObject result = new JSONObject();
        if (resultTotal > 0) {
            result.put("success", true);
        } else {
            result.put("success", false);
        }
        ResponseUtil.write(response, result);
        return null;
    }

    @RequestMapping("/existGroupName")
    public String existGroupName(String groupName, HttpServletResponse response) throws Exception {
        JSONObject result = new JSONObject();
        if (groupService.findById(groupName) == null) {
            result.put("exist", false);
        } else {
            result.put("exist", true);
        }
        ResponseUtil.write(response, result);
        return null;
    }

    @RequestMapping("listAllGroups")
    public String listAllGroups(HttpServletResponse response) throws Exception {
        List<Group> groupList = groupService.find(null);
        JSONObject result = new JSONObject();
        JSONArray jsonArray = JSONArray.fromObject(groupList);
        result.put("groupList", jsonArray);
        ResponseUtil.write(response, result);
        return null;

    }

    @RequestMapping("findGroupByUserId")
    public String findGroupByUserId(String userId, HttpServletResponse response) throws Exception {
        List<Group> groupList = groupService.findByUserId(userId);
        StringBuffer groups = new StringBuffer();
        for (Group group : groupList) {
            groups.append(group.getId() + ",");
        }
        JSONObject result = new JSONObject();
        if (groups.length() > 0) {
            result.put("groups", groups.deleteCharAt(groups.length() - 1).toString());
        } else {
            result.put("groups", groups.toString());
        }
        ResponseUtil.write(response, result);
        return null;
    }


}
