package com.spring.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.dto.ReviewDTO;
import com.spring.gds.dto.GdsCartDTO;

@Repository
public class GdsOrderMemoryRepository implements GdsOrderRepository{
	
	private long seq = 0L;
	private List<GdsCartDTO> tempStore; //DB table -> order

	
	public GdsOrderMemoryRepository(List<GdsCartDTO> tempStore) {
		this.tempStore = tempStore;
		
	}

	@Override //추가하기
	public void add(GdsCartDTO gdsOrderDTO) {
		
		gdsOrderDTO.setCartNum(seq);
		seq ++; //임의의 장바구니 cartNum 생성 추가
		tempStore.add(gdsOrderDTO); //insert
	}
	

	@Override //선택된 장바구니 상품 가져오기
	public List<GdsCartDTO> selectedCartList(List<Long> nums) {
		
		List<GdsCartDTO> list = new ArrayList<GdsCartDTO>();
		
		for(Long num : nums) {
			for(GdsCartDTO dto: tempStore) {
				if(num.equals(dto.getCartNum())) {
					list.add(dto);
				}
			}
		}
		return list;
	}

	@Override //가져오기
	public List<GdsCartDTO> getGdsList() {
		
		return tempStore;
	}
	
	public void clearStore() {
		tempStore.clear();
	}

	
	//toString Method
	//HashCode Method
	
}
