package com.spring.dto.user;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;


public class PwSearchDTO {
	
	@Size(min=2, max=15)
	@Pattern(regexp="[a-zA-Z0-9]*")
	@NotBlank
	private	String id;
	@NotBlank
	@Email
	private	String email;
	@NotBlank
	private	String tel;
	
	private boolean pwSearch;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public boolean isPwSearch() {
		return pwSearch;
	}
	public void setPwSearch(boolean pwSearch) {
		this.pwSearch = pwSearch;
	}
	
}
