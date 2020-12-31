package com.spring.dto.user;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class UserDTO {
	
	private int userNum;
	
	@Size(min=2, max=15)
	@Pattern(regexp="[가-힣]*")
	@NotBlank
	private String name;
	
	@Size(min=4, max=20)
	@Pattern(regexp="[a-zA-Z0-9]*")
	@NotBlank
	private String id;
	
	@Size(min=4, max=20)
	@Pattern(regexp="([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9]){8,12}")
	@NotBlank
	private String pw1;
	
	@Size(min=4, max=20)
	private String pw2;
	@NotBlank
	@Email
	private String email;

	@NotBlank
	private String tel;
	private Date data;
	@NotBlank
	private String mAddr;
	
	@NotBlank
	private String lAddr;
	
	@NotBlank
	private String dlAddr;
	private Date lastData;
	private boolean checkId;
	private boolean logLogin;
	private boolean idSearch;
	private boolean pwSearch;
	
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw1() {
		return pw1;
	}
	public void setPw1(String pw1) {
		this.pw1 = pw1;
	}
	public String getPw2() {
		return pw2;
	}
	public void setPw2(String pw2) {
		this.pw2 = pw2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public String getmAddr() {
		return mAddr;
	}
	public void setmAddr(String mAddr) {
		this.mAddr = mAddr;
	}
	public String getlAddr() {
		return lAddr;
	}
	public void setlAddr(String lAddr) {
		this.lAddr = lAddr;
	}
	public String getDlAddr() {
		return dlAddr;
	}
	public void setDlAddr(String dlAddr) {
		this.dlAddr = dlAddr;
	}
	public Date getLastData() {
		return lastData;
	}
	public void setLastData(Date lastData) {
		this.lastData = lastData;
	}
	public boolean isCheckId() {
		return checkId;
	}
	public void setCheckId(boolean checkId) {
		this.checkId = checkId;
	}
	public boolean isLogLogin() {
		return logLogin;
	}
	public void setLogLogin(boolean logLogin) {
		this.logLogin = logLogin;
	}
	public boolean isIdSearch() {
		return idSearch;
	}
	public void setIdSearch(boolean idSearch) {
		this.idSearch = idSearch;
	}
	public boolean isPwSearch() {
		return pwSearch;
	}
	public void setPwSearch(boolean pwSearch) {
		this.pwSearch = pwSearch;
	}
	
}
