package com.lym.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.lym.entity.Group;
import com.lym.entity.MemberShip;
import com.lym.entity.User;
import com.lym.service.GroupService;
import com.lym.service.ImportUserByExcelService;
import com.lym.service.MemberShipService;
import com.lym.service.UserService;
import com.lym.util.PageBean;
import com.lym.util.ResponseUtil;
import com.lym.util.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 用户controller
 *
 * @author ASUS
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;

    @Resource
    private MemberShipService memberShipService;

    @Resource
    private GroupService groupService;

    @Resource
    private ImportUserByExcelService importUserByExcelService;

    /**
     * 用户登陆
     *
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/login")
    public String login(HttpServletResponse response, HttpServletRequest request) throws Exception {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String groupId = request.getParameter("groupId");
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("userName", userName);
        map.put("password", password);
        map.put("groupId", groupId);
        MemberShip memberShip = memberShipService.login(map);
        JSONObject result = new JSONObject();
        if (memberShip == null) {
            result.put("success", false);
            result.put("errorInfo", "用户名密码错误!");
        } else {
            result.put("success", true);
            request.getSession().setAttribute("currentMemberShip", memberShip);
        }
        ResponseUtil.write(response, result);
        return null;
    }

    /**
     * 根据条件分页查询所有用户信息
     *
     * @param page
     * @param rows
     * @param s_user
     * @param response
     * @param
     * @throws Exception
     */
    @RequestMapping("/list")
    public String list(@RequestParam(value = "page", required = false) String page,
                       @RequestParam(value = "rows", required = false) String rows, User s_user, HttpServletResponse response)
            throws Exception {
        PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
        // 设置查询条件
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", StringUtil.formatLike(s_user.getId()));
        map.put("start", pageBean.getStart());
        map.put("size", pageBean.getPageSize());

        List<User> userList = userService.find(map);
        Long total = userService.getTotal(map);
        JSONObject result = new JSONObject();
        JSONArray jsonArray = JSONArray.fromObject(userList);
        // easyUI需要的数据
        result.put("rows", jsonArray); // 获得记录数
        result.put("total", total); // 获得总数
        ResponseUtil.write(response, result);
        return null;
    }

    /**
     * 根据条件分页查询所有用户信息
     *
     * @param page
     * @param rows
     * @param s_user
     * @param response
     * @param
     * @return
     * @throws Exception
     */
    @RequestMapping("/listWithGroups")
    public String listWithGroups(@RequestParam(value = "page", required = false) String page,
                                 @RequestParam(value = "rows", required = false) String rows, User s_user, HttpServletResponse response)
            throws Exception {
        PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", StringUtil.formatLike(s_user.getId())); // 查询用户名获取
        map.put("start", pageBean.getStart());
        map.put("size", pageBean.getPageSize());
        List<User> userList = userService.find(map);
        for (User user : userList) {
            StringBuffer groups = new StringBuffer();
            List<Group> groupList = groupService.findByUserId(user.getId());
            for (Group g : groupList) {
                groups.append(g.getName() + ",");
            }
            if (groups.length() > 0) {
                user.setGroups(groups.deleteCharAt(groups.length() - 1).toString());
            } else {
                user.setGroups(groups.toString());
            }
        }
        Long total = userService.getTotal(map);
        JSONObject result = new JSONObject();
        JSONArray jsonArray = JSONArray.fromObject(userList);
        result.put("rows", jsonArray);
        result.put("total", total);
        ResponseUtil.write(response, result);
        return null;
    }

    /**
     * 删除用户可多选
     *
     * @param ids
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/delete")
    public String delete(@RequestParam(value = "ids", required = false) String ids, HttpServletResponse response)
            throws Exception {
        String[] id = ids.split(",");
        for (int i = 0; i < id.length; i++) {
            userService.delete(id[i]);
        }
        JSONObject result = new JSONObject();
        result.put("success", true);
        ResponseUtil.write(response, result);
        return null;
    }

    /**
     * 添加用户
     *
     * @param user
     * @param response
     * @param flag
     * @return
     * @throws Exception
     */
    @RequestMapping("/save")
    public String save(User user, HttpServletResponse response, Integer flag) throws Exception {
        int resultTotal = 0;
        if (flag == 1) {
            resultTotal = userService.add(user);
        } else {
            resultTotal = userService.update(user);
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

    @RequestMapping("/saveByExcel")
    public String saveByExcel(@RequestParam("userFile") MultipartFile userFile, Integer flag,
                              HttpServletResponse response, HttpServletRequest request) throws Exception {
        if (userFile == null) return null;
        //获取文件名
        String name = userFile.getOriginalFilename();
        //进一步判断文件是否为空（即判断其大小是否为0或其名称是否为null）
        long size = userFile.getSize();
        if (name == null || ("").equals(name) && size == 0) return null;

        //批量导入。参数：文件名，文件。
        boolean b = importUserByExcelService.excelUpload(name, userFile);
        JSONObject result = new JSONObject();
        if (b) {
            result.put("success", true);
        } else {
            result.put("success", false);
        }
        ResponseUtil.write(response, result);
        return null;

    }

    /**
     * 检查用户名是否存在
     *
     * @param userName
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/existUserName")
    public String existUserName(String userName, HttpServletResponse response) throws Exception {
        JSONObject result = new JSONObject();
        if (userService.findById(userName) == null) {
            result.put("exist", false);
        } else {
            result.put("exist", true);
        }
        ResponseUtil.write(response, result);
        return null;
    }

    /**
     * 修改用户密码
     *
     * @param id
     * @param newPassword
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/modifyPassword")
    public String modifyPassword(String id, String newPassword, HttpServletResponse response) throws Exception {
        User user = new User();
        user.setId(id);
        user.setPassword(newPassword);
        JSONObject result = new JSONObject();
        int resultTotal = userService.update(user);
        if (resultTotal > 0) {
            result.put("success", true);
        } else {
            result.put("success", false);
        }
        ResponseUtil.write(response, result);
        return null;
    }

    /**
     * 用户注销
     *
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session) throws Exception {
        session.invalidate();
        return "redirect:/login.jsp";
    }
}
