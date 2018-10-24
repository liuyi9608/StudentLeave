package com.lym.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lym.entity.Leave;
import com.lym.service.LeaveService;
import com.lym.util.DateJsonValueProcessor;
import com.lym.util.PageBean;
import com.lym.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * 请假单controller
 *
 * @author ASUS
 */
@Controller
@RequestMapping("/leave")
public class LeaveController {

    @Resource
    private LeaveService leaveService;

    @Resource
    private TaskService taskService;

    @Resource
    private RuntimeService runtimeService;

    /**
     * 根据条件分页查询所有请假单信息
     *
     * @param page
     * @param rows
     * @param leaveId
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    public String list(@RequestParam(value = "page", required = false) String page,
                       @RequestParam(value = "rows", required = false) String rows, String userId, HttpServletResponse response)
            throws Exception {
        PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("userId", userId);
        map.put("start", pageBean.getStart());
        map.put("size", pageBean.getPageSize());
        List<Leave> leaveList = leaveService.find(map);
        Long total = leaveService.getTotal(map);
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor("yyyy-MM-dd hh:mm:ss"));
        JSONObject result = new JSONObject();
        JSONArray jsonArray = JSONArray.fromObject(leaveList, jsonConfig);
        result.put("rows", jsonArray);
        result.put("total", total);
        ResponseUtil.write(response, result);
        return null;
    }

    /**
     * 保存请假单
     *
     * @param leave
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/save")
    public String save(Leave leave, HttpServletResponse response) throws Exception {
        int resultTotal = 0;
        leave.setLeaveDate(new Date());
        resultTotal = leaveService.add(leave);

        JSONObject result = new JSONObject();
        if (resultTotal > 0) {
            result.put("success", true);
        } else {
            result.put("success", false);
        }
        ResponseUtil.write(response, result);
        return null;
    }

    /**
     * 发起请假申请，修改请假单
     *
     * @param leaveId
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/startApply")
    public String startApply(Integer leaveId, HttpServletResponse response) throws Exception {
        Map<String, Object> variables = new HashMap<String, Object>();
        variables.put("leaveId", leaveId);
        ProcessInstance pi = runtimeService.startProcessInstanceByKey("studentProcessLeave", variables);  // 启动流程
        Task task = taskService.createTaskQuery().processInstanceId(pi.getProcessInstanceId()).singleResult(); // 根据流程实例Id查询任务
        taskService.complete(task.getId());  // 完成 学生填写请假单任务

        Leave leave = leaveService.findById(leaveId);
        leave.setState("审核中");
        leave.setProcessInstanceId(pi.getProcessInstanceId());
        leaveService.update(leave); // 修改请假单状态
        JSONObject result = new JSONObject();
        result.put("success", true);
        ResponseUtil.write(response, result);
        return null;
    }

    /**
     * 获得当前任务的请假单信息
     *
     * @param taskId
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/getLeaveByTaskId")
    public String getLeaveByTaskId(String taskId, HttpServletResponse response) throws Exception {

        Integer leaveId = (Integer) taskService.getVariable(taskId, "leaveId");
        Leave leave = leaveService.findById(leaveId);
        JSONObject result = new JSONObject();
        result.put("leave", JSONObject.fromObject(leave));
        ResponseUtil.write(response, result);
        return null;
    }

}
