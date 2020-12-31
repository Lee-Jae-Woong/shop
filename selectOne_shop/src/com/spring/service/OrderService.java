package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gds.dto.GdsCartDTO;
import com.spring.repository.GdsOrderMemoryRepository;

@Service
public class OrderService {
	
	@Autowired
	GdsOrderMemoryRepository gdsOrderRepository; //db

	//추가하기
	public void add(GdsCartDTO gdsOrderDTO) {
		
		gdsOrderRepository.add(gdsOrderDTO);
	}
	
	//선택된 번호(cartNum)만 가져오기 
	public List<GdsCartDTO> selectedCartList(List<Long> nums) {
		return gdsOrderRepository.selectedCartList(nums);
	}
	
	
	//가져오기
	public List<GdsCartDTO> getGdsList(){
		
		return gdsOrderRepository.getGdsList();
		
	}
	
	

}
