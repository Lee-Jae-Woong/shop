package com.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.user.UserCartDTO;
import com.spring.gds.dto.GdsCartDTO;
import com.spring.gds.dto.GdsOrderDTO;
import com.spring.repository.CartDAO;

@Service
public class CartService {


	@Autowired
	CartDAO cartDAO;
	

	//추가하기
	public void addCart(GdsCartDTO gdsCartDTO) {
			
		cartDAO.addCart(gdsCartDTO);
		System.out.println(gdsCartDTO.toString());
	}
		
	//가져오기
	public List<UserCartDTO> getGdsList(int userNum){
			
		List<UserCartDTO> list = cartDAO.getGdsList(userNum);
			
			
		return list;		
	}
		
	
//	장바구니1개 삭제하기
	public void delete(GdsCartDTO gdsCartDTO){
		cartDAO.delete(gdsCartDTO);
		
	}
	
	public void deleteOne(int cartNum) {
		cartDAO.deleteOne(cartNum);
	}
	
//	장바구니 비우기
	public void deleteAll(long userNum) {
		cartDAO.deleteAll(userNum);
	}
	

// 장바구니 수량 수정
	public void cartUpdate(GdsCartDTO gdsCartDTO) {
		cartDAO.cartUpdate(gdsCartDTO);
		
	}
	
//	장바구니 선택삭제 
	public void deleteChoice(ArrayList<Integer> cartNums) {
		
		for(int i = 0; i < cartNums.size(); i++) {
			
			int cartNum = cartNums.get(i);
			cartDAO.deleteChoice(cartNum);
		}
	}
	
//	장바구니 선택주문
	public List<UserCartDTO> orderSelect(ArrayList<Integer> cartNums) {
	
		List<UserCartDTO> cartList = new ArrayList<UserCartDTO>();

		for(int i = 0; i < cartNums.size(); i++) {
			
			int cartNum = cartNums.get(i);

			cartList.addAll(i,cartDAO.orderSelect(cartNum));
		}
		
		return cartList;
	}
	
	//장바구니 갯수 가져오기 
	
	public int getCartCount(int userNum) {
		return cartDAO.getCartCount(userNum);
	}
	
}
