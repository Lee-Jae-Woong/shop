package com.spring.gds.dto;

public class GdsInfoDTO {

	private long gdsNum;
	private String cateName;
	private String gdsName;
	private int gdsPrice;
	private int gdsStock;
	private String thumbImg;
	private int review_count;
	private boolean like;
	private String gdsDetail;
	private String gdsColor;
	
	
	
	public String getGdsDetail() {
		return gdsDetail;
	}
	public void setGdsDetail(String gdsDetail) {
		this.gdsDetail = gdsDetail;
	}
	public String getGdsColor() {
		return gdsColor;
	}
	public void setGdsColor(String gdsColor) {
		this.gdsColor = gdsColor;
	}
	public long getGdsNum() {
		return gdsNum;
	}
	public void setGdsNum(long gdsNum) {
		this.gdsNum = gdsNum;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getGdsName() {
		return gdsName;
	}
	public void setGdsName(String gdsName) {
		this.gdsName = gdsName;
	}
	public int getGdsPrice() {
		return gdsPrice;
	}

	public int getGdsStock() {
		return gdsStock;
	}
	public void setGdsStock(int gdsStock) {
		this.gdsStock = gdsStock;
	}
	public void setGdsPrice(int gdsPrice) {
		this.gdsPrice = gdsPrice;
	}
	public String getThumbImg() {
		return thumbImg;
	}
	public void setThumbImg(String thumbImg) {
		this.thumbImg = thumbImg;
	}
	public int getReview_count() {
		return review_count;
	}
	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}
	public boolean isLike() {
		return like;
	}
	public void setLike(boolean like) {
		this.like = like;
	}
	
	
	

}
