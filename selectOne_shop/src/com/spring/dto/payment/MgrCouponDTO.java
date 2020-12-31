package com.spring.dto.payment;

public class MgrCouponDTO {
	

	private int mgrCp; //쿠폰번호
	private String cpName; //쿠폰이름
	private String itemScope; //적용 범위
	private double cpRate; //쿠폰 할인율
	private String expDate; // 쿠폰 만료기간
	private String cpCode ; // 쿠폰 코드
	private String cpCode2;
	private String cpCode3;
	private String cpCode4;
	
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
	public String getCpCode() {
		return cpCode;
	}
	public void setCpCode(String cpCode) {
		this.cpCode = cpCode.toUpperCase();
	}
	public String getCpCode2() {
		return cpCode2;
	}
	public void setCpCode2(String cpCode2) {
		this.cpCode2 = cpCode2.toUpperCase();
	}
	public String getCpCode3() {
		return cpCode3;
	}
	public void setCpCode3(String cpCode3) {
		this.cpCode3 = cpCode3.toUpperCase();
	}
	public String getCpCode4() {
		return cpCode4;
	}
	public void setCpCode4(String cpCode4) {
		this.cpCode4 = cpCode4.toUpperCase();
	}
	
	
	
	
	
	
	

	
	
}
