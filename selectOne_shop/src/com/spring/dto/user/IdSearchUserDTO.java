package com.spring.dto.user;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class IdSearchUserDTO {
	
	@Size(min=2, max=15)
	@Pattern(regexp="[가-힣]*")
	@NotBlank
	private	String name;
	@NotBlank
	@Email
	private	String email;
	@NotBlank
	private	String tel;
	
	private boolean idSearch;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public boolean isIdSearch() {
		return idSearch;
	}
	public void setIdSearch(boolean idSearch) {
		this.idSearch = idSearch;
	}
}
