package com.spring.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.annotation.SessionScope;

import com.spring.dto.user.LoginUserDTO;

//data를 저장하거나 관리 목적으로 사용하는 빈들을 등록함
// Bean 을 정의하는 xml 파일 지정하기
// 프로젝트에서 사용하는 Bean을 정의하는 클래스
// (root-context.xml)
@Configuration
public class RootAppContext {

	@Bean("loginUserBean")
	@SessionScope
	public LoginUserDTO loginUserBean() {
		return new LoginUserDTO();
	}

}
