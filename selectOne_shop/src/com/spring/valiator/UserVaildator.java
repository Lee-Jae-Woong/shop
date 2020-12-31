package com.spring.valiator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.spring.dto.user.IdSearchUserDTO;
import com.spring.dto.user.LoginDTO;
import com.spring.dto.user.PwPermuteDTO;
import com.spring.dto.user.PwSearchDTO;
import com.spring.dto.user.UserDTO;
import com.spring.dto.user.UserInfoModifyDTO;
import com.spring.dto.user.UserModifyDTO;

public class UserVaildator implements Validator {

	
	@Override
	public boolean supports(Class<?> clazz) {
		System.out.println("va");
		return UserDTO.class.isAssignableFrom(clazz)
				|| LoginDTO.class.isAssignableFrom(clazz)
				|| IdSearchUserDTO.class.isAssignableFrom(clazz)
				|| PwSearchDTO.class.isAssignableFrom(clazz)
				|| PwPermuteDTO.class.isAssignableFrom(clazz)
				|| UserModifyDTO.class.isAssignableFrom(clazz)
				|| UserInfoModifyDTO.class.isAssignableFrom(clazz);
	}
	@Override
	public void validate(Object target, Errors errors) {

		String beanName = errors.getObjectName();
		System.out.println(beanName);

			
		if (beanName.equals("userDTO")) {
			UserDTO userDTO = (UserDTO)target;
			if (userDTO.getPw1().equals(userDTO.getPw2()) == false) {
				errors.rejectValue("pw1", "NotEquals");
				errors.rejectValue("pw2", "NotEquals");
			}
			if (userDTO.isCheckId() == false) {
				errors.rejectValue("id", "DontChecked");
			}
		}
		if (beanName.equals("loginUserDTO")) {
			LoginDTO loginUserDTO = (LoginDTO)target;
			if (loginUserDTO.isLogLogin() == false) {
				errors.rejectValue("id", "LoginError");
			}
		}
		if (beanName.equals("idsearchUserDTO")) {
			IdSearchUserDTO idsearchUserDTO = (IdSearchUserDTO)target;
			if (idsearchUserDTO.isIdSearch() == false) {
				errors.rejectValue("idSearch", "IdSearchError");
			}
		}
		if (beanName.equals("pwsearchUserDTO")) {
			PwSearchDTO pwsearchUserDTO = (PwSearchDTO)target;
			if (pwsearchUserDTO.isPwSearch() == false) {
				errors.rejectValue("pwSearch","PwSearchError");
			}
		}
		if (beanName.equals("pwPermuteUserDTO")) {
			PwPermuteDTO pwPermuteUserDTO = (PwPermuteDTO)target;
			if (pwPermuteUserDTO.isPwSearch() == false) {
				errors.rejectValue("pwSearch", "PwPermuteError");
			}
			if (pwPermuteUserDTO.getPw1().equals(pwPermuteUserDTO.getPw2()) == false) {
				errors.rejectValue("pw1", "NotEquals");
				errors.rejectValue("pw2", "NotEquals");
			}
		}
		if(beanName.equals("userModifyDTO")) {
			UserModifyDTO userModifyDTO = (UserModifyDTO)target;
			if(userModifyDTO.isModifyPw() == false) {
				System.out.println(userModifyDTO.isModifyPw());
				errors.rejectValue("pw", "NotPw");
			}
		}
		if(beanName.equals("userInfoModifyDTO")) {
			UserInfoModifyDTO userInfoModifyDTO = (UserInfoModifyDTO)target;
			if (userInfoModifyDTO.getPw1().equals(userInfoModifyDTO.getPw2()) == false) {
				errors.rejectValue("pw1", "NotEquals");
			}
		}
	}
}
