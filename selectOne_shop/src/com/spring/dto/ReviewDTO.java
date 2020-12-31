package com.spring.dto;

import java.util.Date;

public class ReviewDTO {
	
	private Long rvNum;      
	private Long gdsNum;     
	private String id;      
	private String rvText; 
	private String rvImg;      
	private String rvDate;       
    private int rvScore;
    
    
    
	public ReviewDTO() {

	}

	public ReviewDTO(Long gdsNum, String id, String rvText, String rvImg, int rvScore) {
		this.gdsNum = gdsNum;
		this.id = id;
		this.rvText = rvText;
		this.rvImg = rvImg;
		this.rvScore = rvScore;
	}
	
	public Long getRvNum() {
		return rvNum;
	}
	public void setRvNum(Long rvNum) {
		this.rvNum = rvNum;
	}
	public Long getGdsNum() {
		return gdsNum;
	}
	public void setGdsNum(Long gdsNum) {
		this.gdsNum = gdsNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRvText() {
		return rvText;
	}
	public void setRvText(String rvText) {
		this.rvText = rvText;
	}
	public String getRvImg() {
		return rvImg;
	}
	public void setRvImg(String rvImg) {
		this.rvImg = rvImg;
	}
	public String getRvDate() {
	
		return rvDate;
	}
	public void setRvDate(String rvDate) {
		this.rvDate = rvDate;
	}
	public int getRvScore() {
		return rvScore;
	}
	public void setRvScore(int rvScore) {
		this.rvScore = rvScore;
	}
    
    
    

}
