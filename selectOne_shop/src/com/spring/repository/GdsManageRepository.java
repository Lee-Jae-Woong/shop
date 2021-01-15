package com.spring.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.gds.dto.GdsDetailDTO;
import com.spring.gds.dto.GdsInfoDTO;
import com.spring.mapper.GdsMapper;

@Repository
public class GdsManageRepository {
	
	@Autowired
	 private GdsMapper gdsMapper;
	
	public List<GdsInfoDTO> getAllGdsList() {
		
		return gdsMapper.getAllGdsList();
		
	}
	
	public List<GdsInfoDTO> searchResult(String keyword) {
		
		return gdsMapper.searchResult(keyword);
		
	}
	
	public GdsDetailDTO getGdsDetail(String gdsNum) {
		return gdsMapper.getGdsDetail(gdsNum);
	}
	
	public int getGdsStock(String gdsNum) {
		return gdsMapper.getGdsStock(gdsNum);
	}
	public void updateStock(String gdsNum, int count) {
		gdsMapper.updateStock(gdsNum, count);
	}
}
