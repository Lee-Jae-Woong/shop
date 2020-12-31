package com.spring.dto.payment;

public class CouponInfoDTO {
	

	private int cpNum; //사용자 쿠폰번호
	private String cpCode; //관리자 쿠폰번호 FK
	private int userNum; 
	private int mgrCp; //쿠폰번호
	private String cpName; //쿠폰이름
	private String itemScope; //적용 범위
	private double cpRate; //쿠폰 할인율
	private String expDate; // 쿠폰 만료기간
	private String useCp; //사용가능여부
	
	
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
		this.cpCode = cpCode;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public int getMgrCp() {
		return mgrCp;
	}
	public void setMgrCp(int mgrCp) {
		this.mgrCp = mgrCp;
	}
	public String getCpName() {
		return cpName;
	}
	public void setCpName(String cpName) {
		this.cpName = cpName;
	}
	public String getItemScope() {
		return itemScope;
	}
	public void setItemScope(String itemScope) {
		this.itemScope = itemScope;
	}
	public double getCpRate() {
		return cpRate;
	}
	public void setCpRate(double cpRate) {
		this.cpRate = cpRate;
	}
	public String getExpDate() {
		return expDate;
	}
	public void setExpDate(String expDate) {
		this.expDate = expDate;
	}
	public String getUseCp() {
		return useCp;
	}
	public void setUseCp(String useCp) {
		this.useCp = useCp;
	}
	
	
		
	
}
