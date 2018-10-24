package com.lym.controller;

import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.activiti.engine.HistoryService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.repository.ProcessDefinition;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lym.util.PageBean;
import com.lym.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * 流程定义Controller
 *
 * @author user
 */
@Controller
@RequestMapping("/processDefinition")
public class ProccessDefinitionController {

    @Resource
    private RepositoryService repositoryService;

    @Resource
    private HistoryService historyService;

    /**
     * 流程定义查询
     *
     * @param page
     * @param rows
     * @param s_name
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    public String list(@RequestParam(value = "page", required = false) String page,
                       @RequestParam(value = "rows", required = false) String rows, String s_name, HttpServletResponse response)
            throws Exception {
        if (s_name == null) {
            s_name = "";
        }
        PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));

        List<ProcessDefinition> processDefinitionList = repositoryService.createProcessDefinitionQuery() // 创建流程定义查询
                .processDefinitionNameLike("%" + s_name + "%").orderByProcessDefinitionId().desc() // 按照定义的版本降序排序
                .listPage(pageBean.getStart(), pageBean.getPageSize()); // 分页显示所有的数据
        long total = repositoryService.createProcessDefinitionQuery().processDefinitionNameLike("%" + s_name + "%")
                .count();

        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setExcludes(new String[]{"identityLinks", "processDefinition"});
        JSONObject result = new JSONObject();
        JSONArray jsonArray = JSONArray.fromObject(processDefinitionList, jsonConfig);
        // easyUI需要的数据
        result.put("rows", jsonArray); // 获得记录数
        result.put("total", total); // 获得总数
        ResponseUtil.write(response, result);
        return null;
    }

    @RequestMapping("/showView")
    public String showView(String diagramResourceName, String deploymentId, HttpServletResponse response)
            throws Exception {
        InputStream inputStream = repositoryService.getResourceAsStream(deploymentId, diagramResourceName);
        OutputStream outputStream = response.getOutputStream();
        for (int b = -1; (b = inputStream.read()) != -1; ) {
            outputStream.write(b);
        }
        outputStream.close();
        inputStream.close();
        return null;
    }

    /**
     * 查看流程图
     *
     * @param deploymentId
     * @param diagramResourceName
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/showViewByTaskId")
    public String showViewByTaskId(String taskId, HttpServletResponse response) throws Exception {
        HistoricTaskInstance hti = historyService.createHistoricTaskInstanceQuery().taskId(taskId).singleResult();
        String processDefinitionId = hti.getProcessDefinitionId(); // 获取流程定义id
        ProcessDefinition pd = repositoryService.createProcessDefinitionQuery().processDefinitionId(processDefinitionId)
                .singleResult();
        InputStream inputStream = repositoryService.getResourceAsStream(pd.getDeploymentId(),
                pd.getDiagramResourceName());
        OutputStream out = response.getOutputStream();
        for (int b = -1; (b = inputStream.read()) != -1; ) {
            out.write(b);
        }
        out.close();
        inputStream.close();
        return null;
    }

}
