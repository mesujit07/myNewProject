package com.example.new_Project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.example.new_Project.DAO.userRepositoryy;
import com.example.new_Project.Entity.User;
import com.example.new_Project.service.UserService;

@Controller
public class LoginController {
    
	   @Autowired
	  UserService userService;
	   
	   @Autowired
	   userRepositoryy userRepositoryy;
	    
    @GetMapping("/login")
    public String loadHome(ModelMap map) {
        return "login";
    }

    @PostMapping("/login")
    public String handleLogin(@RequestParam String username, @RequestParam String password, RedirectAttributes redirectAttributes,HttpSession session,ModelMap map) {
        return userService.setlogin(username, password, redirectAttributes,session,map);
    }
    
	@GetMapping("/reset")
	public String loadreset(ModelMap map) {
		return "reset";
	}
	
	
	@PostMapping("/reset")
	public String handleReset(@RequestParam String username, @RequestParam String password, ModelMap map) {    
	  return userService.resetPassword(username,password,map);
	}
	
    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable int id, ModelMap map) {
        userRepositoryy.deleteById(id);
        map.addAttribute("deletemessage", "User deleted successfully.");
        return "redirect:/fetchAllRecords";
    }
    
    @GetMapping("/fetchAllRecords")
    public String loadUserPage(@RequestParam(value = "fetchAll", defaultValue = "true") boolean fetchAll,
                               @RequestParam(value = "username", required = false) String username, 
                               ModelMap map) {

        List<User> users;
        
        if (username != null && !username.isEmpty()) {
            User userinfo = userService.getUserByUsername(username);
            users = userinfo != null ? List.of(userinfo) : List.of();
        } else {
            users = userService.handleUserRequest();  
        }

        map.addAttribute("userList", users);

        if (fetchAll) {
            return "fetchAllRecords"; 
        } else {
            return "fragments/userTable"; 
        }
    }


	
	@GetMapping("/register")
	public String loadregister(ModelMap map) {
		return "register";
	}
	
	
	
	@PostMapping("/register")
	public String handleRegister(@RequestParam String username, @RequestParam String password, ModelMap map,@RequestParam String email) {
		return userService.setregister(username,password,email,map);
	}
	
	@GetMapping(value = "/searchByUsername", produces = "application/json")
	@ResponseBody
	public List<User> searchByUsername(@RequestParam(value = "username") String username) {
	    User user = userRepositoryy.findByUsername(username);

	    if (user != null) {
	        return List.of(user);  
	    } else {
	        return List.of(); 
	    
	    }
	}
	
	

}
