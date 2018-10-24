package com.lym.controller;

import java.util.List;
import java.util.zip.ZipInputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Deployment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.lym.util.DateJsonValueProcessor;
import com.lym.util.PageBean;
import com.lym.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * 流程部署Controller
 *
 * @author user
 */
@Controller
@RequestMapping("/deploy")
public class DeployController {

    @Resource
    private RepositoryService repositoryService;

    /**
     * 流程部署查询
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

        List<Deployment> deploymentList = repositoryService.createDeploymentQuery() // 创建流程部署查询
                .deploymentNameLike("%" + s_name + "%").orderByDeploymenTime().desc() // 按照部署的时间降序排序
                .listPage(pageBean.getStart(), pageBean.getPageSize()); // 分页显示所有的数据
        long total = repositoryService.createDeploymentQuery().deploymentNameLike("%" + s_name + "%").count();

        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setExcludes(new String[]{"resources"});
        jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd hh:mm:ss"));
        JSONObject result = new JSONObject();
        JSONArray jsonArray = JSONArray.fromObject(deploymentList, jsonConfig);
        // easyUI需要的数据
        result.put("rows", jsonArray); // 获得记录数
        result.put("total", total); // 获得总数
        ResponseUtil.write(response, result);
        return null;
    }

    @RequestMapping("/deploy")
    public String deploy(@RequestParam("deployFile") MultipartFile deployFile, HttpServletResponse response)
            throws Exception {
        repositoryService.createDeployment() //创建部署
                .name(deployFile.getOriginalFilename()) //流程名称
                .addZipInputStream(new ZipInputStream(deployFile.getInputStream())) //从zip部署
                .deploy();
        JSONObject result = new JSONObject();
        result.put("success", true);
        ResponseUtil.write(response, result);
        return null;
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam(value = "ids", required = false) String ids,
                         HttpServletResponse response) throws Exception {
        String[] id = ids.split(",");
        for (int i = 0; i < id.length; i++) {
            repositoryService.deleteDeployment(id[i], true);
        }
        JSONObject result = new JSONObject();
        result.put("success", true);
        ResponseUtil.write(response, result);
        return null;
    }
}
