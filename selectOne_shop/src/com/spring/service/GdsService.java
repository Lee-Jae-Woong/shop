package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gds.dto.GdsDetailDTO;
import com.spring.gds.dto.GdsInfoDTO;
import com.spring.repository.GdsManageRepository;

@Service
public class GdsService {
	

	@Autowired
	GdsManageRepository gdsManageRepository;
	
	public List<GdsInfoDTO> getAllGdsList(){
		return gdsManageRepository.getAllGdsList();
	};
	
	public List<GdsInfoDTO> searchResult(String keyword){
		return gdsManageRepository.searchResult(keyword);
	};
	
	public GdsDetailDTO getGdsDetail(String gdsNum) {
		return gdsManageRepository.getGdsDetail(gdsNum);
	}
	
	//수량 체크 
	public int getGdsStock(String gdsNum) {
		return gdsManageRepository.getGdsStock(gdsNum);
	}
	//구매후 stock update
	public void updateStock(String gdsNum, int count) {
	    gdsManageRepository.updateStock(gdsNum,count);
	}
	
}
