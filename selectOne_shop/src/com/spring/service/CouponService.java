package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.payment.CouponDTO;
import com.spring.dto.payment.CouponInfoDTO;
import com.spring.repository.CouponDAO;


@Service
public class CouponService {

	@Autowired
	private CouponDAO couponDAO; //db
		
	
	public void regCoupon(CouponDTO couponDTO) {
		
	
		couponDAO.regCoupon(couponDTO);
		
	}

	public List<CouponInfoDTO> cpList(int userNum) {

		List<CouponInfoDTO> initCpListBean = couponDAO.cpList(userNum );
		
		return initCpListBean;

	}
	public List<CouponInfoDTO> allCpList(int userNum) {

		List<CouponInfoDTO> initAllCpListBean = couponDAO.allCpList(userNum );
		
		return initAllCpListBean;

	}
	
	
	 public void updateCp(int userNum){
		 couponDAO.updateCp(userNum );
		
	    }
	 
	 
	 public String existCp(CouponDTO couponDTO) {
		
		 String initExistCpBean = couponDAO.existCp(couponDTO);
			
			return initExistCpBean;

	    }
		

}
