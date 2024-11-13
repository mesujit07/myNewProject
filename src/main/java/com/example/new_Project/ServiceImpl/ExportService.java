package com.example.new_Project.ServiceImpl;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Header;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.new_Project.DAO.userRepositoryy;
import com.example.new_Project.Entity.User;

@Service
public class ExportService {

	userRepositoryy repositoryy;

	@Autowired
	public ExportService(userRepositoryy repositoryy) {
		this.repositoryy = repositoryy;
	}

	public void exportData(HttpServletResponse response) throws IOException {
		List<User> users = repositoryy.findAll();
		Workbook workbook = new XSSFWorkbook();
		Sheet sheet = workbook.createSheet("users");

		Row header = sheet.createRow(0);
		header.createCell(0).setCellValue("Id");
		header.createCell(1).setCellValue("username");
		header.createCell(2).setCellValue("Password");
		header.createCell(3).setCellValue("Email");

		int rowNumber = 1;
		for (User user : users) {
			Row row = sheet.createRow(rowNumber);
			row.createCell(0).setCellValue((double) user.getId());
			row.createCell(1).setCellValue(user.getUsername());
			row.createCell(2).setCellValue(user.getPassword());
			row.createCell(3).setCellValue(user.getEmail());
			rowNumber++;
		}

		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		String headerValue = "attachment; filename=UserData.xlsx";
		response.setHeader("Content-Disposition", headerValue);

		workbook.write(response.getOutputStream());
		workbook.close();

	}
}
