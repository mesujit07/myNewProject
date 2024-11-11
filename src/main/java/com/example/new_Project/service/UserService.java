package com.example.new_Project.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.new_Project.Entity.User;



@Service
public interface UserService {
	

	String setlogin(String username, String password, RedirectAttributes redirectAttributes);

	String setregister(String username, String password, String email, ModelMap map);
	
	List handleUserRequest();
	
	String resetPassword(String username, String password, ModelMap map);
	

	User getUserByUsername(String username);
	
	void deleteRecord(int id, ModelMap map);

}