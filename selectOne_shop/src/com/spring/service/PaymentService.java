package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.payment.PaymentDTO;
import com.spring.dto.payment.PointDTO;
import com.spring.repository.PaymentDAO;

@Service
public class PaymentService {

	@Autowired
	private PaymentDAO dao;


	public void insertPayment(PaymentDTO paymentDTO) {

		dao.insertPayment(paymentDTO);
	}

	
	public List<PaymentDTO> myPage(int userNum) {

		List<PaymentDTO> initPaymentBean = dao.myPage(userNum);
		
		return initPaymentBean;

	}
	
	public List<PaymentDTO> pointView(int userNum) {

		List<PaymentDTO> initpointViewBean = dao.pointView(userNum);
		
		return initpointViewBean;

	}

	public PaymentDTO paymentSelect(int payNum) {

		PaymentDTO initPaymentBean = dao.paymentSelect(payNum);
		
		return initPaymentBean;

	}
	
	public PointDTO totalPoint(int payNum) {

		PointDTO initPointBean = dao.totalPoint(payNum);
		
		return initPointBean;

	}
	
	public PaymentDTO paymentResult(int userNum) {

		PaymentDTO initPaymentBean = dao.paymentResult(userNum);
		
		return initPaymentBean;

	}
	
}