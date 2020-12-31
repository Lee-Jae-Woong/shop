package com.spring.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dto.user.IdSearchUserDTO;
import com.spring.dto.user.LoginDTO;
import com.spring.dto.user.LoginUserDTO;
import com.spring.dto.user.PwPermuteDTO;
import com.spring.dto.user.PwSearchDTO;
import com.spring.dto.user.UserDTO;
import com.spring.dto.user.UserInfoModifyDTO;
import com.spring.dto.user.UserModifyDTO;
import com.spring.service.UserService;
import com.spring.valiator.UserVaildator;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Resource(name = "loginUserBean")
	private LoginUserDTO loginUserBean;

	/* 회원가입 약관 */
	@GetMapping(value = "/join")
	public String join() {
		return "user/terms";
	}

	/* 회원가입 양식 */
	@RequestMapping(value = "/join/form", method = {RequestMethod.POST,
			RequestMethod.GET})
	public String join_form(@ModelAttribute("userDTO") UserDTO userDTO) {
		return "user/join";
	}
	/* 회원가입 */
	@PostMapping(value = "/join/join_proc")
	public String join_proc(@Valid @ModelAttribute("userDTO") UserDTO userDTO,
			BindingResult result) {
		if (result.hasErrors()) {
			return "user/join";
		}
		String pw1 = passwordEncoder.encode(userDTO.getPw1());
		userDTO.setPw1(pw1);
		userService.insertUserInfo(userDTO);
		return "redirect:joinResult";
	}
	/* 가입완료 */
	@GetMapping(value = "join/joinResult")
	public String joinResult() {
		return "user/joinResult";
	}

	/* 로그인 */
	@RequestMapping(value = "/login", method = {RequestMethod.POST,
			RequestMethod.GET})
	public String login(@ModelAttribute("loginUserDTO") UserDTO loginUserDTO) {

		return "user/login";
	}

	/* 로그인 */
	@RequestMapping(value = "/login/login_proc", method = {RequestMethod.POST,
			RequestMethod.GET})
	public String loginproc(
			@Valid @ModelAttribute("loginUserDTO") LoginDTO loginUserDTO,
			BindingResult result, HttpSession session) {

		if (result.hasErrors()) {
			System.out.println("result.hasErrors");

			String pw1 = userService.selectLoginPw(loginUserDTO);
			String pw2 = loginUserDTO.getPw1();
			if (passwordEncoder.matches(pw2, pw1) == true) {
				loginUserDTO.setLogLogin(true);
				System.out.println("result.hasErrors");
				userService.loginSelect(loginUserDTO);
				session.setAttribute("loginUser", loginUserBean);
				return "redirect:/";
			}
			loginUserDTO.setLogLogin(false);
			return "user/login";
		}
		return "user/login";
	}
	/* 로그아웃 */
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		userService.logout();
		session.setAttribute("loginUser", loginUserBean);

		return "redirect:/";
	}
	/* id 찾기 */
	@RequestMapping(value = "/user/idSearch", method = {RequestMethod.POST,
			RequestMethod.GET})
	public String idSearch(
			@ModelAttribute("idsearchUserDTO") IdSearchUserDTO idsearchUserDTO) {

		return "user/idSearch";
	}
	@RequestMapping(value = "/user/idSearch_proc", method = {RequestMethod.POST,
			RequestMethod.GET})
	public String idSearch_proc(
			@Valid @ModelAttribute("idsearchUserDTO") IdSearchUserDTO idsearchUserDTO,
			BindingResult result, Model model) {
		if (result.hasErrors()) {
			// 에러 발생
			if (userService.idSearch(idsearchUserDTO) == null) { // 못찾음 -> 에러
				idsearchUserDTO.setIdSearch(false);
				return "user/idSearch";
			}
			// 에러 없을때
			idsearchUserDTO.setIdSearch(true);

			String id = userService.idSearch(idsearchUserDTO);
			model.addAttribute("id", id);

			return "user/idResult";
		}
		return "user/idResult";
	}

	/* password 찾기 */
	@RequestMapping(value = "/user/pwSearch", method = {RequestMethod.GET,
			RequestMethod.POST})
	public String pwSearch(
			@ModelAttribute("pwsearchUserDTO") PwSearchDTO pwsearchUserDTO) {
		return "user/pwSearch";
	}
	@RequestMapping(value = "/user/pwSearch_proc", method = {RequestMethod.GET,
			RequestMethod.POST})
	public String pwSearch(
			@Valid @ModelAttribute("pwsearchUserDTO") PwSearchDTO pwsearchUserDTO,
			BindingResult result, Model model, RedirectAttributes rttr) {
		if (result.hasErrors()) {
			if (userService.pwSearch(pwsearchUserDTO) != null) { // db에 pw == null 이면
				pwsearchUserDTO.setPwSearch(true);

				PwPermuteDTO pwPermuteUserDTO = new PwPermuteDTO();
				String id = pwsearchUserDTO.getId();
				pwPermuteUserDTO.setId(id);
				String email = pwsearchUserDTO.getEmail();
				pwPermuteUserDTO.setEmail(email);
				String tel = pwsearchUserDTO.getTel();
				pwPermuteUserDTO.setTel(tel);

				model.addAttribute("pwPermuteUserDTO", pwPermuteUserDTO);
				return "user/pwPermute";
			}
			pwsearchUserDTO.setPwSearch(false);
			return "user/pwSearch";
		}
		return "user/pwSearch";
	}

	/* password 변경하기 */
	@RequestMapping(value = "/user/pwPermute", method = {RequestMethod.GET,
			RequestMethod.POST})
	public String pwPermute(
			@ModelAttribute("pwPermuteUserDTO") PwPermuteDTO pwPermuteUserDTO,
			Model model) {
		model.addAttribute("pwPermuteUserDTO", pwPermuteUserDTO);
		return "user/pwPermute";
	}

	@RequestMapping(value = "/user/pwPermute_proc", method = {RequestMethod.GET,
			RequestMethod.POST})
	public String pwPermute_proc(
			@Valid @ModelAttribute("pwPermuteUserDTO") PwPermuteDTO pwPermuteUserDTO,
			BindingResult result, Model model) {
		if (result.hasErrors()) {
			PwPermuteDTO pwPermuteDTO = (PwPermuteDTO) model
					.getAttribute("pwPermuteUserDTO");

			pwPermuteUserDTO.setId(pwPermuteDTO.getId());
			pwPermuteUserDTO.setEmail(pwPermuteDTO.getEmail());
			pwPermuteUserDTO.setTel(pwPermuteDTO.getTel());

			String pw1 = userService.selectSearchPw(pwPermuteUserDTO);
			String pw2 = pwPermuteUserDTO.getPw1();
			if (passwordEncoder.matches(pw2, pw1) == false) {

				pwPermuteUserDTO.setPwSearch(true);
				String pw3 = passwordEncoder.encode(pwPermuteUserDTO.getPw1());
				pwPermuteUserDTO.setPw1(pw3);
				userService.pwUpdate(pwPermuteUserDTO);

				LoginDTO loginDTO = new LoginDTO();
				model.addAttribute("loginUserDTO", loginDTO);
				return "user/login";
			}
			pwPermuteUserDTO.setPwSearch(false);
			return "user/pwPermute";
		}

		return "user/pwPermute";
	}

	@RequestMapping(value = "/infoModify", method = {RequestMethod.GET,
			RequestMethod.POST})
	public String infoModify(@ModelAttribute("userModifyDTO")UserModifyDTO userModifyDTO) {

		
		return "infoModify";
	}
	@RequestMapping(value = "/infoModify_proc", method = {RequestMethod.GET,
			RequestMethod.POST})
	public String infoModify_proc(@Valid @ModelAttribute("userModifyDTO")UserModifyDTO userModifyDTO, BindingResult result,UserInfoModifyDTO userInfoModifyDTO, Model model) {
		if (result.hasErrors()) {
			userModifyDTO.setId(loginUserBean.getId());
			String pw = userService.selectModifyPw(userModifyDTO);
			String pw1 = userModifyDTO.getPw();
			System.out.println("con");
			if (passwordEncoder.matches(pw1, pw) == true) {
				System.out.println("con");
				userModifyDTO.setModifyPw(true);	
				return "infoModify_form";
			}
			System.out.println("con");
			model.addAttribute("userInfoModifyDTO", userInfoModifyDTO);
			userModifyDTO.setModifyPw(false);
			return "infoModify";
		}
		return "infoModify";
	}
	@RequestMapping(value ="/infoModify_form",method = {RequestMethod.GET,RequestMethod.POST})
	public String infoModify_form(@ModelAttribute("userInfoModifyDTO") UserInfoModifyDTO userInfoModifyDTO) {
		
		return "infoModify_form";
	}
	@RequestMapping(value = "/infoModify_form_proc", method = {RequestMethod.GET,RequestMethod.POST})
	public String infoModify_form_proc(@Valid @ModelAttribute("userInfoModifyDTO") UserInfoModifyDTO userInfoModifyDTO,BindingResult result) {
		if (result.hasErrors()) {
			
			return "infoModify_form";
		}
		userInfoModifyDTO.setUserNum(loginUserBean.getUserNum());
		String pw1 = passwordEncoder.encode(userInfoModifyDTO.getPw1());
		userInfoModifyDTO.setPw1(pw1);
		userService.infoUpdate(userInfoModifyDTO);
		return "/home";
	}
	@RequestMapping(value = "/infoDelete", method = {RequestMethod.GET,
			RequestMethod.POST})
	public String infoDelete(HttpSession session) {
		int userNum = loginUserBean.getUserNum();
		userService.infoDelete(userNum);

		userService.logout();
		session.setAttribute("loginUser", loginUserBean);

		return "home";
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		UserVaildator validator = new UserVaildator();
		binder.addValidators(validator);
	}
}
