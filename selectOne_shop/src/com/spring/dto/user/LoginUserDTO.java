package com.spring.dto.user;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component("user")
@Scope("session")
public class LoginUserDTO {
	
	private int userNum; //user_info pk 
	private String name; // user_info
	private String id; // 
	private boolean check;
	private String email;
	private String tel;
	private String mAddr;
	private String lAddr;
	private String dlAddr;
	
	
	public LoginUserDTO() {
		this.check = false;
	}
	
	public void clear() {
		this.check = false;
	}
	

	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}


	public void setId(String id) {
		this.id = id;
	}


	public int getUserNum() {
		return userNum;
	}

	public String getId() {
		return id;
	}

	public boolean isCheck() {
		return check;
	}

	public void setCheck(boolean check) {
		this.check = check;
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
