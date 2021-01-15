
package com.spring.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dto.payment.PaymentDTO;
import com.spring.dto.payment.PointDTO;
import com.spring.mapper.PaymentMapper;

@Repository
public class PaymentDAO{

    @Autowired
    private PaymentMapper paymentMapper;

    public void insertPayment(PaymentDTO paymentDTO){
    	paymentMapper.insertPayment(paymentDTO);
    }
    
    public List<PaymentDTO> myPage(int userNum) {
    	return paymentMapper.myPage(userNum);
    }
    
    public List<PaymentDTO> pointView(int userNum) {
    	return paymentMapper.pointView(userNum);
    }
    
    public PaymentDTO paymentSelect(int payNum) {
    	return paymentMapper.paymentSelect(payNum);
    }
    
    public PointDTO totalPoint(int payNum) {
    	return paymentMapper.totalPoint(payNum);
    }
    
    public PaymentDTO paymentResult(int userNum) {
    	return paymentMapper.paymentResult(userNum);
    }
}