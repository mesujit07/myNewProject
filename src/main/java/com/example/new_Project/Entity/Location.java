package com.example.new_Project.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "location")

public class Location {
	String company;
	String zone;
	String circle;
	String divison;
	String subdivision;
	String section;
	String siteCode;
	String dbuser;
	String emailids;
	String phonenos;
	String newssitecode;
	String helpdesk_no;
	@Id
	String circle_code;
    @Column(name = "division_code")
    private String divisionname;
    
    
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getZone() {
		return zone;
	}
	public void setZone(String zone) {
		this.zone = zone;
	}
	public String getCircle() {
		return circle;
	}
	public void setCircle(String circle) {
		this.circle = circle;
	}
	public String getDivison() {
		return divison;
	}
	public void setDivison(String divison) {
		this.divison = divison;
	}
	public String getSubdivision() {
		return subdivision;
	}
	public void setSubdivision(String subdivision) {
		this.subdivision = subdivision;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getSiteCode() {
		return siteCode;
	}
	public void setSiteCode(String siteCode) {
		this.siteCode = siteCode;
	}
	public String getDbuser() {
		return dbuser;
	}
	public void setDbuser(String dbuser) {
		this.dbuser = dbuser;
	}


	public String getNewssitecode() {
		return newssitecode;
	}
	public void setNewssitecode(String newssitecode) {
		this.newssitecode = newssitecode;
	}
	public String getHelpdesk_no() {
		return helpdesk_no;
	}
	public void setHelpdesk_no(String helpdesk_no) {
		this.helpdesk_no = helpdesk_no;
	}
	public String getCircle_code() {
		return circle_code;
	}
	public void setCircle_code(String circle_code) {
		this.circle_code = circle_code;
	}
	public String getEmailids() {
		return emailids;
	}
	public void setEmailids(String emailids) {
		this.emailids = emailids;
	}
	public String getPhonenos() {
		return phonenos;
	}
	public void setPhonenos(String phonenos) {
		this.phonenos = phonenos;
	}
	public String getDivisionname() {
		return divisionname;
	}
	public void setDivisionname(String divisionname) {
		this.divisionname = divisionname;
	}

	
	


}
