package com.spring.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.payment.MgrCouponDTO;
import com.spring.repository.MgrCouponDAO;


@Service
public class MgrCouponService {

	@Autowired
	MgrCouponDAO mgrCouponDAO; //db

	
	public MgrCouponDTO cpCodeSelect(String cpCode) {

		MgrCouponDTO initCouponBean = mgrCouponDAO.cpCodeSelect(cpCode);
		
		return initCouponBean;

	}
	
	
	
	public String checkCpCode(MgrCouponDTO mgrCouponDTO) {

		return mgrCouponDAO.checkCpCode(mgrCouponDTO);
		
	}
	


}
