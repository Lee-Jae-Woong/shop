package com.spring.repository;

import java.util.List;

import com.spring.dto.ReviewDTO;
import com.spring.gds.dto.GdsCartDTO;

public interface GdsOrderRepository {
	
	// 상품 추가하기 (장바구니) 
	void add(GdsCartDTO gdsOrderDTO);
	List<GdsCartDTO> getGdsList(); 
	List<GdsCartDTO> selectedCartList(List<Long> nums);
	
	

}
