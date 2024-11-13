package com.example.new_Project.controller;

import java.io.IOException;
import java.net.http.HttpRequest;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.new_Project.ServiceImpl.ExportService;

@Controller
@RequestMapping("/export")
public class ImportExcel {
	
	@Autowired
	ExportService exportService;

	@GetMapping("/users")
	public void handleExport(HttpServletResponse response) throws IOException
	{
		exportService.exportData(response);
	}
}
