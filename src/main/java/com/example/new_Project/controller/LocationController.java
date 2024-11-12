package com.example.new_Project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.new_Project.Entity.Location;
import com.example.new_Project.ServiceImpl.LocationService;

@Controller
public class LocationController {

    @Autowired
    LocationService localService;

   
    @GetMapping("/locations")
    public String getAllLocations(ModelMap model) {
        List<Location> locations = localService.getAllLocations();
        model.addAttribute("locations", locations);
        return "locations";
    }

   
    @GetMapping("/searchByZone")
    public String searchByZone(@RequestParam("zone") String zone, ModelMap model) {
        System.out.println("Searching for zone: " + zone);
        List<Location> locations = localService.searchLocationsByZone(zone);
        model.addAttribute("locations", locations);
        return "locations";
    }
}