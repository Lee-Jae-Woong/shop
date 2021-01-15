package com.spring.dto.user;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class UserModifyDTO {

	private String id;
	@Size(min = 4, max = 20)
	@Pattern(regexp = "([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9]){8,12}")
	@NotBlank
	private String pw;

	private boolean modifyPw;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public boolean isModifyPw() {
		return modifyPw;
	}

	public void setModifyPw(boolean modifyPw) {
		this.modifyPw = modifyPw;
	}

}
