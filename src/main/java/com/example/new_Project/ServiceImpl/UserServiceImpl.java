package com.example.new_Project.ServiceImpl;

import java.net.http.HttpRequest;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.new_Project.DAO.userRepositoryy;
import com.example.new_Project.Entity.User;
import com.example.new_Project.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	userRepositoryy userRepositoryy;

	@Override
	public String setlogin(String username, String password, RedirectAttributes redirectAttributes,HttpSession session,ModelMap map) {
		User user = userRepositoryy.findByUsername(username);

		if (user != null && user.getPassword().equals(password)) {
			session.removeAttribute("errorlogin");
			session.setAttribute("username", username);
			session.setAttribute("message", "Welcome to BCITS, " + username + "!");
			redirectAttributes.addFlashAttribute("message", "Welcome to BCITS, " + username + "!");
			return "redirect:/fetchAllRecords";
		} else {
			map.addAttribute("errorlogin", "Invalid username or password.");
			return "login";
		}
	}

	@Override
	public String setregister(String username, String password, String email, ModelMap map) {
		List<User> users = handleUserRequest();
		boolean usernameExists = false;

		for (User user : users) {
			if (user.getUsername().equals(username)) {
				usernameExists = true;
				break;
			}
		}
		if (!usernameExists) {
			User user = new User();
			user.setName(username);
			user.setPassword(password);
			user.setEmail(email);
			userRepositoryy.save(user);
			map.addAttribute("info", "Congratulations, " + username + "! You have successfully registered.");

			return "login";
		} else {

			map.addAttribute("errorregister","The username " + username + " already exists. Please choose a different one.");
			return "register";
		}
	}

	@Override
	public List handleUserRequest() {
		return userRepositoryy.findAll();

	}

	@Override
	public String resetPassword(String username, String password, ModelMap map) {
		User user = userRepositoryy.findByUsername(username);
		if (user != null) {
			user.setPassword(password);
			userRepositoryy.save(user);
			map.addAttribute("resetinfo", "Password updated successfully!");
			return "login";

		} else {
			map.addAttribute("reseterror", "User not found.");
			return "login";
		}

	}

	@Override
	public User getUserByUsername(String username) {
		return userRepositoryy.findByUsername(username);
	}

	@Override
	public void deleteRecord(int id, ModelMap map) {
		map.addAttribute("delete", "successfully deleted");
		userRepositoryy.deleteById(id);
		List<User> users = userRepositoryy.findAll();
		map.addAttribute("users", users);

	}
}
