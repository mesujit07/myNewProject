package com.example.new_Project.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.new_Project.Entity.Location;

public interface LocationRepository extends JpaRepository<Location, String> {


	List<Location> findByZone(String zone);
}