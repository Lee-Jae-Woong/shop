package com.spring.dto.user;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class UserInfoModifyDTO {

	private int userNum;
	@Size(min = 4, max = 20)
	@Pattern(regexp = "([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9]){8,12}")
	@NotBlank
	private String pw1;
	@Size(min = 4, max = 20)
	private String pw2;
	@NotBlank
	@Email
	private String email;
	@NotBlank
	private String tel;
	@NotBlank
	private String mAddr;
	@NotBlank
	private String lAddr;
	@NotBlank
	private String dlAddr;

	
	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
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

}
