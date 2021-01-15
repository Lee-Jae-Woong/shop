package com.spring.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dto.payment.CouponDTO;
import com.spring.dto.payment.CouponInfoDTO;
import com.spring.mapper.CouponMapper;

@Repository
public class CouponDAO{

    @Autowired
    private CouponMapper couponMapper;	
    
    public void regCoupon(CouponDTO couponDTO) {
    	couponMapper.regCoupon(couponDTO);
    };
    
    public List<CouponInfoDTO> cpList(int userNum) {
    	return couponMapper.cpList(userNum);
    }
    
    public List<CouponInfoDTO> allCpList(int userNum) {
    	return couponMapper.allCpList(userNum);
    }
    
    public void updateCp(int cpNum){
    	couponMapper.updateCp(cpNum);
    }
    
    public String existCp(CouponDTO couponDTO) {
    	return couponMapper.existCp(couponDTO);
    }
	
}