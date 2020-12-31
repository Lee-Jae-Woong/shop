package com.spring.dto.user;

public class UserLikeDTO {
	
	
	private int likeNum;
	private int gdsNum;
	private int userNum; 
	private String thumbImg;
	private String gdsName;
	
	public UserLikeDTO() {}
	public UserLikeDTO(int gdsNum, int userNum) {

		this.gdsNum = gdsNum;
		this.userNum = userNum;
	}
	
	public int getLikeNum() {
		return likeNum;
	}
	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}
	public int getGdsNum() {
		return gdsNum;
	}
	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getThumbImg() {
		return thumbImg;
	}
	public void setThumbImg(String thumbImg) {
		this.thumbImg = thumbImg;
	}
	public String getGdsName() {
		return gdsName;
	}
	public void setGdsName(String gdsName) {
		this.gdsName = gdsName;
	}
	
	
	
	
}
