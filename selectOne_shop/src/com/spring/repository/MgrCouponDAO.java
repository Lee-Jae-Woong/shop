package com.spring.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dto.payment.MgrCouponDTO;
import com.spring.mapper.MgrCouponMapper;

@Repository 
public class MgrCouponDAO{

    @Autowired
    private MgrCouponMapper mgrCouponMapper;
    
    public MgrCouponDTO  cpCodeSelect(String cpCode) {
    	
    	String cpCodeUpper = cpCode.toUpperCase();
    	
    	return mgrCouponMapper.cpCodeSelect(cpCodeUpper);
    }
                                                
	public String checkCpCode(MgrCouponDTO mgrCouponDTO) {
		System.out.println("check");
		return mgrCouponMapper.checkCpCode(mgrCouponDTO);
	}


	  
}