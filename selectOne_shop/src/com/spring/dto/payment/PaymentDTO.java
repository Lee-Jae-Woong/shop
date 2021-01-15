package com.spring.dto.payment;

import java.util.Date;


import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;


public class PaymentDTO {
	
	private int payNum;
	private int userNum;
	private String userId;
	private String ordName;
	private String ordNum;
	private String ordColor;
	private String ordCount;
	private String ordPrice;
	private Date payDate;
	private String receiver;
	private String email;
	private String phone;
	private String addr1;
	private String addr2;
	private String addr3;
	private String message;
	private String depositor;
	private String bankName;
	private String payMethod;
	private int cal;
	private int point;
	private int usePoint;
	private int useCouponCal;
	private int cpNum;
	
	
	
	
	
	public String getOrdPrice() {
		return ordPrice;
	}
	public void setOrdPrice(String ordPrice) {
		this.ordPrice = ordPrice;
	}
	public int getUseCouponCal() {
		return useCouponCal;
	}
	public void setUseCouponCal(int useCouponCal) {
		this.useCouponCal = useCouponCal;
	}
	public int getUsePoint() {
		return usePoint;
	}
	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getOrdName() {
		return ordName;
	}
	public void setOrdName(String ordName) {
		this.ordName = ordName;
	}
	public String getOrdNum() {
		return ordNum;
	}
	public void setOrdNum(String ordNum) {
		this.ordNum = ordNum;
	}
	public String getOrdColor() {
		return ordColor;
	}
	public void setOrdColor(String ordColor) {
		this.ordColor = ordColor;
	}
	public String getOrdCount() {
		return ordCount;
	}
	public void setOrdCount(String ordCount) {
		this.ordCount = ordCount;
	}
	public int getPayNum() {
		return payNum;
	}
	public void setPayNum(int payNum) {
		this.payNum = payNum;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getAddr3() {
		return addr3;
	}
	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getDepositor() {
		return depositor;
	}
	public void setDepositor(String depositor) {
		this.depositor = depositor;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public int getCal() {
		return cal;
	}
	public void setCal(int cal) {
		this.cal = cal;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	public int getCpNum() {
		return cpNum;
	}
	public void setCpNum(int cpNum) {
		this.cpNum = cpNum;
	}
	
}
