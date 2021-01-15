package com.spring.gds.dto;

public class GdsCartDTO {
	

	/* [cart entity]
	 * 
	 * cartNum number PK not null, 
	 * userNum number FK not null, 
	 * gdsNum number FK not null,
	 * cartCount number not null, 
	 * cartColor varchar2(50) not null
	 * 
	 */
	 
	 private long cartNum; //seq로 생성됨
	 private long userNum;
	 private long gdsNum;
	 private int cartCount;
	 private String cartColor;
	 private int cartPrice;
	 
	
	
	public GdsCartDTO() {}




	public GdsCartDTO(long cartNum, long userNum, long gdsNum, int cartCount, String cartColor, int cartPrice) {
		this.cartNum = cartNum;
		this.userNum = userNum;
		this.gdsNum = gdsNum;
		this.cartCount = cartCount;
		this.cartColor = cartColor;
		this.cartPrice = cartPrice;
	}




	public long getCartNum() {
		return cartNum;
	}




	public void setCartNum(long cartNum) {
		this.cartNum = cartNum;
	}




	public long getUserNum() {
		return userNum;
	}




	public void setUserNum(long userNum) {
		this.userNum = userNum;
	}




	public long getGdsNum() {
		return gdsNum;
	}




	public void setGdsNum(long gdsNum) {
		this.gdsNum = gdsNum;
	}




	public int getCartCount() {
		return cartCount;
	}




	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}




	public String getCartColor() {
		return cartColor;
	}




	public void setCartColor(String cartColor) {
		this.cartColor = cartColor;
	}




	public int getCartPrice() {
		return cartPrice;
	}




	public void setCartPrice(int cartPrice) {
		this.cartPrice = cartPrice;
	}
	
	
	
	
	
	
	
	
    

}
