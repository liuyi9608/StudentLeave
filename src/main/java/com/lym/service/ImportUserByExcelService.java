package com.lym.service;

import org.springframework.web.multipart.MultipartFile;

public interface ImportUserByExcelService {
	public boolean excelUpload(String name, MultipartFile file);
}
