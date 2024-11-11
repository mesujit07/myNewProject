package com.example.new_Project.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Controller;

import com.example.new_Project.Entity.User;



@Controller
public interface userRepositoryy extends JpaRepository<User, Integer> {
	 User findByUsername(String username);
}