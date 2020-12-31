package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.gds.dto.GdsCartDTO;
import com.spring.service.CartService;

@RestController
public class CartRestController {
	
	@Autowired
	CartService cartService;
	
	
	@PostMapping(value="/order/add")
	public void addOrder(@RequestBody GdsCartDTO gdsCartDTO){
		
		cartService.addCart(gdsCartDTO);
		System.out.println(gdsCartDTO.toString());
	
	}
	
}
