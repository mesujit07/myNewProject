package com.example.new_Project.ServiceImpl;

import java.awt.Color;
import java.io.IOException;
import java.io.InputStream;
import java.net.http.HttpRequest;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Header;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.new_Project.DAO.userRepositoryy;
import com.example.new_Project.Entity.User;
import com.example.new_Project.service.Exportservice;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

@Service
public class ExportService implements Exportservice{

   userRepositoryy userRepository;

   
    @Autowired
    public ExportService(	userRepositoryy userRepository) {
        this.userRepository = userRepository;
    }

    private List<User> getAllUsers() {
        return userRepository.findAll();
    }
    
  
	public void exportDataExcel(HttpServletResponse response) throws IOException {
		
		 List<User> users = getAllUsers();

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

   
	public void writeTable(PdfPTable table, Font headerFont) {
		PdfPCell cell = new PdfPCell();
		cell.setBackgroundColor(BaseColor.BLACK);
		cell.setPadding(5);

		Font font = FontFactory.getFont(FontFactory.HELVETICA);
		font.setColor(BaseColor.WHITE);

		cell.setPhrase(new Phrase("User ID", font));
		table.addCell(cell);

		cell.setPhrase(new Phrase("E-mail", font));
		table.addCell(cell);

		cell.setPhrase(new Phrase("username", font));
		table.addCell(cell);

		cell.setPhrase(new Phrase("password", font));
		table.addCell(cell);
	}

   
	public void writeTableData(PdfPTable table) {
		List<User> users = getAllUsers();
		for (User user : users) {
			table.addCell(String.valueOf(user.getId()));
			table.addCell(user.getEmail());
			table.addCell(user.getUsername());
			table.addCell(user.getPassword());
		}

	}

   
	public void exportData(HttpServletResponse response) throws DocumentException, IOException {
		Document document = new Document(PageSize.A4);
		PdfWriter.getInstance(document, response.getOutputStream());

		document.open();
		Font headerFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
		headerFont.setSize(18);
		headerFont.setColor(BaseColor.BLUE);

		Paragraph p = new Paragraph("List of Users", headerFont);
		p.setAlignment(Paragraph.ALIGN_CENTER);
		document.add(p);

		PdfPTable table = new PdfPTable(4);
		table.setWidths(new float[] { 1.5f, 3.5f, 3.0f, 3.0f });


		writeTable(table, headerFont);
		writeTableData(table);

		document.add(table);
		document.close();
	}

   
	public void importExcelService(MultipartFile file) throws IOException {
		InputStream inputStream=file.getInputStream();
		Workbook workbook = new XSSFWorkbook(inputStream);

		Sheet sheet=workbook.getSheetAt(0);
		
		  Iterator<Row> rowIterator = sheet.iterator();
		  while(rowIterator.hasNext())
		  {
			  Row row=rowIterator.next();
			  if(row.getRowNum()==0)
			  {
				  continue;
			  }
			    int id = 0;
			    if (row.getCell(0).getCellType() == CellType.NUMERIC) {
			        id = (int) row.getCell(0).getNumericCellValue();
			    } else if (row.getCell(0).getCellType() == CellType.STRING) {
			        id = Integer.parseInt(row.getCell(0).getStringCellValue());
			    }
			  String username=row.getCell(2).getStringCellValue();		
			  String password=row.getCell(3).getStringCellValue();		  
			  String email=row.getCell(1).getStringCellValue();
			  
			  User user=new User();
			  user.setId(id);
			  user.setEmail(email);
			  user.setName(username);
			  user.setPassword(password);
			  userRepository.save(user);
		  }
		  workbook.close();
	}

		
}
