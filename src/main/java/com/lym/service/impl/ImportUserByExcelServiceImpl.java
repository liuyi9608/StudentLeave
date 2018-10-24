package com.lym.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.lym.dao.UserDao;
import com.lym.entity.User;
import com.lym.util.ReadExcel;

@Service("ImportUserByExcelServiceImpl")
public class ImportUserByExcelServiceImpl implements com.lym.service.ImportUserByExcelService {

    @Resource
    private UserDao userDao;

    public boolean excelUpload(String name, MultipartFile file) {
        boolean b = false;
        //创建处理EXCEL
        ReadExcel readExcel = new ReadExcel();
        //解析excel，获取客户信息集合。
        List<User> userList = readExcel.getExcelInfo(name, file);


        if (userList != null) {
            b = true;
        }

        //迭代添加客户信息（注：实际上这里也可以直接将customerList集合作为参数，在Mybatis的相应映射文件中使用foreach标签进行批量添加。）
        for (User user : userList) {
            userDao.add(user);
        }
        return b;
    }

}
