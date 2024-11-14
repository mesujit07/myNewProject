package com.example.new_Project.controller;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.new_Project.DAO.userRepositoryy;
import com.example.new_Project.Entity.User;
import com.example.new_Project.ServiceImpl.ExportService;
import com.itextpdf.text.DocumentException;

@Controller
@RequestMapping("/export")
public class ImportExcel {

	@Autowired
	ExportService exportService;
	


	@GetMapping("/users/excel")
	public void handleExportExcel(HttpServletResponse response) throws IOException {
		exportService.exportDataExcel(response);
	}

	@GetMapping("/users/pdf")
	public void handleExportPdf(HttpServletResponse response) throws IOException, DocumentException {
		response.setContentType("application/pdf");
		String headerValue = "attachment; filename=users_" + ".pdf";
		response.setHeader("Content-Disposition", headerValue);
		exportService.exportData(response);

	}
	
	@PostMapping("/upload-excel")
	public String handleImportExcel(@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) throws IOException {
	    try {
	        exportService.importExcelService(file);  
	        redirectAttributes.addFlashAttribute("successupload", "File uploaded and data saved successfully!");
	    } catch (Exception e) {
	        redirectAttributes.addFlashAttribute("errorupload", "Error uploading the file. Please try again.");
	    }
	    return "redirect:/fetchAllRecords";  
	}

}
