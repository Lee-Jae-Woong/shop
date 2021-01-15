package com.spring.service;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.user.IdSearchUserDTO;
import com.spring.dto.user.LoginDTO;
import com.spring.dto.user.LoginUserDTO;
import com.spring.dto.user.PwPermuteDTO;
import com.spring.dto.user.PwSearchDTO;
import com.spring.dto.user.UserDTO;
import com.spring.dto.user.UserInfoModifyDTO;
import com.spring.dto.user.UserModifyDTO;
import com.spring.repository.UserDAO;

@Service
public class UserService {

	@Autowired
	private UserDAO dao;

	@Resource(name = "loginUserBean")
	private LoginUserDTO loginUserBean;

	public void insertUserInfo(UserDTO userDTO) {

		dao.insertUserInfo(userDTO);
	}

	public boolean checkUserId(String id) {
		String name = dao.checkUserId(id);
		System.out.println("con");
		if (name == null) {
			return true;
		} else {
			return false;
		}
	}

	public void loginSelect(LoginDTO loginUserDTO) {

		LoginUserDTO initLoginUserBean = dao.loginSelect(loginUserDTO);

		// bean에 값 넣음
		loginUserBean.setUserNum(initLoginUserBean.getUserNum());
		loginUserBean.setName(initLoginUserBean.getName());
		loginUserBean.setId(initLoginUserBean.getId());
		loginUserBean.setEmail(initLoginUserBean.getEmail());
		loginUserBean.setTel(initLoginUserBean.getTel());
		loginUserBean.setmAddr(initLoginUserBean.getmAddr());
		loginUserBean.setlAddr(initLoginUserBean.getlAddr());
		loginUserBean.setDlAddr(initLoginUserBean.getDlAddr());
		loginUserBean.setCheck(true);

	}
	public String selectLoginPw(@Valid LoginDTO loginUserDTO) {
		return dao.selectLoginPw(loginUserDTO);
	}

	public void lastLogin(LoginDTO loginUserDTO) {
		dao.lastLogin(loginUserDTO);
	}
	public void logout() {
		loginUserBean.clear();

	}
	public String idSearch(IdSearchUserDTO idsearchUserDTO) {
		return dao.idSearch(idsearchUserDTO);
	}

	public String pwSearch(PwSearchDTO pwsearchUserDTO) {
		return dao.pwSearch(pwsearchUserDTO);
	}
	public String selectSearchPw(PwPermuteDTO pwPermuteUserDTO) {
		return dao.selectSearchPw(pwPermuteUserDTO);
	}
	public void pwUpdate(PwPermuteDTO pwPermuteUserDTO) {
		dao.pwUpdate(pwPermuteUserDTO);
	}
	public String selectModifyPw(UserModifyDTO userModifyDTO) {
		return dao.selectModifyPw(userModifyDTO);
	}
	public void infoUpdate(UserInfoModifyDTO userInfoModifyDTO) {
		dao.infoUpdate(userInfoModifyDTO);
	}
	public void infoDelete(int userNum) {
		dao.infoDelete(userNum);
	}
	
}