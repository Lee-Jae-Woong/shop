package com.spring.gds.dto;

import java.util.Date;

public class GdsDTO {
	
	/*
	 * gdsNum number primary key,
    gdsName varchar2(100) not null,
    cateCode number not null,
    gdsPrice number not null,
    gdsColor varchar2(100) not null, 
    gdsStock number null,
    gdsDetail varchar2(500) null,
    gdsImg varchar2(500) not null,
    thumbImg varchar2(100) not null,
    regDate date default sysdate 
    */
	
	private long gdsNum;
	private String gdsName;
	private int cateCode;
	private int gdsPrice;
	private String gdsColor;
	private int gdsStock;
	private String gdsDetail;
	private String gdsImg;
	private String thumbImg;
	private Date regDate;
	
	
	//생성자 
	
	
	//getter 
	public long getGdsNum() {
		return gdsNum;
	}
	public String getGdsName() {
		return gdsName;
	}
	public int getCateCode() {
		return cateCode;
	}
	public int getGdsPrice() {
		return gdsPrice;
	}
	public String getGdsColor() {
		return gdsColor;
	}
	public int getGdsStock() {
		return gdsStock;
	}
	public String getGdsDetail() {
		return gdsDetail;
	}
	public String getGdsImg() {
		return gdsImg;
	}
	public String getThumbImg() {
		return thumbImg;
	}
	public Date getRegDate() {
		return regDate;
	}
	

}
