package com.spring.gds.dto;

public class GdsOrderDTO {
	
	//private long ordNum;
	//private long userNum;
	private long gdsNum;
	private String gdsName;
	private String ordColor;
	//private String cartColor;
	private int ordCount;
	//private int cartCount;
	private int ordPrice;
	private String thumbImg;
	//private int gdsPrice;
	//private int ordPoint; //포인트 컬럼 추가
	
	/*
	 * 	 private long cartNum; //seq로 생성됨
	 private long userNum;
	 private long gdsNum;
	 private int cartCount;
	 private String cartColor;
	 private int cartPrice;*/
	
	

	public long getGdsNum() {
		return gdsNum;
	}

	public void setGdsNum(long gdsNum) {
		this.gdsNum = gdsNum;
	}

	public String getGdsName() {
		return gdsName;
	}

	public void setGdsName(String gdsName) {
		this.gdsName = gdsName;
	}

	public String getOrdColor() {
		return ordColor;
	}

	public void setOrdColor(String ordColor) {
		this.ordColor = ordColor;
	}


	public int getOrdCount() {
		return ordCount;
	}

	public void setOrdCount(int ordCount) {
		this.ordCount = ordCount;
	}

	

	public int getOrdPrice() {
		return ordPrice;
	}

	public void setOrdPrice(int ordPrice) {
		this.ordPrice = ordPrice;
	}

	
	
	public String getThumbImg() {
		return thumbImg;
	}

	public void setThumbImg(String thumbImg) {
		this.thumbImg = thumbImg;
	}

	@Override
	public String toString() {
	
		return getGdsName();
	}
}
