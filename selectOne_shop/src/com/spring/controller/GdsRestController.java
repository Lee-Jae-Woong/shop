package com.spring.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.dto.user.UserLikeDTO;
import com.spring.service.OrderService;
import com.spring.service.UserLikeService;

@RestController
public class GdsRestController {
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	UserLikeService userLikeService;
	
	
	/*
	 * @PostMapping(value="/order") public GdsOrderDTO order(@RequestBody
	 * GdsOrderDTO dto){
	 * 
	 * return dto; }
	 */

	
	//李쒕ぉ濡� 異붽��븯湲� �뀒�뒪�듃
	@PostMapping(value="/shop/like")
	public void addUserLike(@RequestBody UserLikeDTO userLikeDTO){
		
		userLikeService.addUserLike(userLikeDTO);
	}
	@PostMapping(value="/shop/dislike")
	public void deleteUserLike(@RequestBody UserLikeDTO userLikeDTO) {
		userLikeService.deleteUserLike(userLikeDTO);
	}
	
	
	 @PostMapping(value="/shop/purchaseCheck")
	 @ResponseBody
	 public Map<String,String> purchaseCheck(@RequestBody Map<String, Object> param){ 
		 String gdsNum = (String) param.get("gdsNum");
		 String userNum = (String) param.get("userNum");
	  
	 Map <String,String> result = new HashMap<String, String>();
	 result.put("result", "result");
	 return result; }
	 
	 
	
}
