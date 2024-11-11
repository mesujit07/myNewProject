package com.example.new_Project.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.new_Project.DAO.LocationRepository;
import com.example.new_Project.Entity.Location;

@Service
public class LocationService {

    @Autowired
    LocationRepository locationRepository;

    // Get all locations
    public List<Location> getAllLocations() {
        return locationRepository.findAll();
    }

    // Search locations by zone
    public List<Location> searchLocationsByZone(String zone) {
        return locationRepository.findByZone(zone);
    }
}