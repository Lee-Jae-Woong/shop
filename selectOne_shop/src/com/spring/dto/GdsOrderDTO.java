package com.spring.dto;

public class GdsOrderDTO {
	

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
	 
	
	
	public GdsOrderDTO() {}




	public GdsOrderDTO(long cartNum, long userNum, long gdsNum, int cartCount, String cartColor, int cartPrice) {
		this.cartNum = cartNum;
		this.userNum = userNum;
		this.gdsNum = gdsNum;
		this.cartCount = cartCount;
		this.cartColor = cartColor;
		this.cartPrice = cartPrice;
	}
	
	

	public void setCartNum(long cartNum) {
		this.cartNum = cartNum;
	}




	public long getCartNum() {
		return cartNum;
	}



	public long getUserNum() {
		return userNum;
	}



	public long getGdsNum() {
		return gdsNum;
	}



	public int getCartCount() {
		return cartCount;
	}



	public String getCartColor() {
		return cartColor;
	}


	public int getCartPrice() {
		return cartPrice;
	}
	
	
	
	
	
	
	
    

}
