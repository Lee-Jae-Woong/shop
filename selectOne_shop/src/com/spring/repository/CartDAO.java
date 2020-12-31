package com.spring.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dto.user.UserCartDTO;
import com.spring.gds.dto.GdsCartDTO;
import com.spring.gds.dto.GdsOrderDTO;
import com.spring.mapper.CartMapper;

@Repository
public class CartDAO {

	@Autowired
	CartMapper cartMapper;
	
	public void addCart(GdsCartDTO gdsCartDTO) {
		cartMapper.addCart(gdsCartDTO);
		System.out.println(gdsCartDTO.toString());
	}
	
	public List<UserCartDTO> getGdsList(int userNum) {
		
		return cartMapper.getGdsList(userNum);
	}

	public void delete(GdsCartDTO gdsCartDTO) {
		cartMapper.delete(gdsCartDTO);		
	}
	
	public void deleteOne(int cartNum) {
		cartMapper.deleteOne(cartNum);
	}

	public void deleteAll(long userNum) {
		cartMapper.deleteAll(userNum);
	}

	public void cartUpdate(GdsCartDTO gdsCartDTO) {
		cartMapper.cartUpdate(gdsCartDTO);
	}
	
	public void deleteChoice(int cartNum) {
		cartMapper.deleteChoice(cartNum);
	}
	public List<UserCartDTO> orderSelect(int cartNum) {
		return cartMapper.orderSelect(cartNum);
	}
	
	public int getCartCount(int userNum) {
		return cartMapper.getCartCount(userNum);
	}
	
	

}
