package com.lym.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.lym.entity.User;

public class ReadExcel {


    // 总行数
    private int totalRows = 0;
    // 总条数
    private int totalCells = 0;
    // 错误信息接收器
    private String errorMsg;

    // 构造方法
    public ReadExcel() {
    }

    // 获取总行数
    public int getTotalRows() {
        return totalRows;
    }

    // 获取总列数
    public int getTotalCells() {
        return totalCells;
    }

    // 获取错误信息
    public String getErrorInfo() {
        return errorMsg;
    }

    /**
     * 验证EXCEL文件
     *
     * @param filePath
     * @return
     */
    public boolean validateExcel(String filePath) {
        if (filePath == null || !(WDWUtil.isExcel2003(filePath) || WDWUtil.isExcel2007(filePath))) {
            errorMsg = "文件名不是excel格式";
            return false;
        }
        return true;
    }

    /**
     * 读EXCEL文件，获取客户信息集合
     *
     * @param fielName
     * @return
     */
    public List<User> getExcelInfo(String fileName, MultipartFile Mfile) {

        // 把spring文件上传的MultipartFile转换成CommonsMultipartFile类型
        CommonsMultipartFile cf = (CommonsMultipartFile) Mfile; // 获取本地存储路径
        File file = new File("D:\\fileupload");
        // 创建一个目录 （它的路径名由当前 File 对象指定，包括任一必须的父路径。）
        if (!file.exists())
            file.mkdirs();
        // 新建一个文件
        File file1 = new File("D:\\fileupload" + new Date().getTime() + ".xlsx");
        // 将上传的文件写入新建的文件中
        try {
            cf.getFileItem().write(file1);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 初始化客户信息的集合
        List<User> userList = new ArrayList<User>();
        // 初始化输入流
        InputStream is = null;
        try {
            // 验证文件名是否合格
            if (!validateExcel(fileName)) {
                return null;
            }
            // 根据文件名判断文件是2003版本还是2007版本
            boolean isExcel2003 = true;
            if (WDWUtil.isExcel2007(fileName)) {
                isExcel2003 = false;
            }
            // 根据新建的文件实例化输入流
            is = new FileInputStream(file1);
            // 根据excel里面的内容读取客户信息
            userList = getExcelInfo(is, isExcel2003);
            is.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e) {
                    is = null;
                    e.printStackTrace();
                }
            }
        }
        return userList;
    }

    /**
     * 根据excel里面的内容读取客户信息
     *
     * @param is          输入流
     * @param isExcel2003 excel是2003还是2007版本
     * @return
     * @throws IOException
     */
    public List<User> getExcelInfo(InputStream is, boolean isExcel2003) {
        List<User> userList = null;
        try {
            /** 根据版本选择创建Workbook的方式 */
            Workbook wb = null;
            // 当excel是2003时
            if (isExcel2003) {
                wb = new HSSFWorkbook(is);
            } else {// 当excel是2007时
                // wb = new XSSFWorkbook(is);
                wb = new XSSFWorkbook(is);
            }
            // 读取Excel里面客户的信息
            userList = readExcelValue(wb);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return userList;
    }

    /**
     * @param wb
     * @return
     */
    private List<User> readExcelValue(Workbook wb) {
        // 得到第一个shell
        System.out.println("luhan***********************************");
        Sheet sheet = wb.getSheetAt(0);

        // 得到Excel的行数
        this.totalRows = sheet.getPhysicalNumberOfRows();

        // 得到Excel的列数(前提是有行数)
        if (totalRows >= 1 && sheet.getRow(0) != null) {
            this.totalCells = sheet.getRow(0).getPhysicalNumberOfCells();
        }

        List<User> userList = new ArrayList<User>();
        User user = null;
        // 循环Excel行数,从第二行开始。标题不入库
        for (int r = 1; r < totalRows; r++) {
            Row row = sheet.getRow(r);
            if (row == null)
                continue;
            user = new User();

            // 循环Excel的列
            for (int c = 0; c < this.totalCells; c++) {
                Cell cell = row.getCell(c);

                if (null != cell) {
                    if (c == 0) {
                        // CELL.SETCELLTYPE(CELL.CELL_TYPE_STRING);
                        cell.setCellType(Cell.CELL_TYPE_STRING);
                        System.out.println("luhan" + cell.getStringCellValue());
                        user.setId(cell.getStringCellValue());
                    } else if (c == 1) {
                        user.setFirstName(cell.getStringCellValue());
                        System.out.println("luhan" + cell.getStringCellValue());

                    } else if (c == 2) {
                        user.setLastName(cell.getStringCellValue());
                    } else if (c == 3) {
                        user.setEmail(cell.getStringCellValue());
                    }
                } else if (c == 4) {
                    user.setPassword(cell.getStringCellValue());
                }
            }
        }
        // 添加
        userList.add(user);
        return userList;
    }


}
