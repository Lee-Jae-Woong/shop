package com.spring.dto.payment;

public class CouponDTO {
	

	private int cpNum; //사용자 쿠폰번호
	private String cpCode; //관리자 쿠폰번호 FK
	private int userNum; 
	private String useCp;
	
	public int getCpNum() {
		return cpNum;
	}
	public void setCpNum(int cpNum) {
		this.cpNum = cpNum;
	}
	public String getCpCode() {
		return cpCode;
	}
	public void setCpCode(String cpCode) {
		this.cpCode = cpCode.toUpperCase();
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getUseCp() {
		return useCp;
	}
	public void setUseCp(String useCp) {
		this.useCp = useCp;
	}
	
		
	
}
