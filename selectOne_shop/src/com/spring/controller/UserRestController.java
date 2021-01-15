package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.spring.service.UserService;

@RestController
public class UserRestController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/join/checkUserId/{id}")
	public String checkUserId(@PathVariable String id) {
		
    boolean chkResult = userService.checkUserId(id);
    
    return chkResult + "";
  }

}
