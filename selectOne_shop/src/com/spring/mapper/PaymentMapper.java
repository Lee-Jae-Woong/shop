package com.spring.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.spring.dto.payment.PaymentDTO;
import com.spring.dto.payment.PointDTO;

public interface PaymentMapper {



	@Insert("insert into payment(payNum, userNum, ordName, ordNum, ordColor, ordCount, ordPrice, payDate, receiver, email, phone, addr1, addr2, addr3, message, depositor, bankName, payMethod, cal, point, usePoint,useCouponCal , cpNum)" + 
	  		" VALUES(pay_num.nextval, #{userNum}, #{ordName}, to_char(systimestamp, 'YYYYMMDDHHMISS'),#{ordColor},#{ordCount},#{ordPrice},systimestamp,#{receiver},#{email},#{phone},#{addr1},#{addr2},#{addr3},#{message, jdbcType=VARCHAR},#{depositor}, #{bankName},#{payMethod},#{cal},#{point}, #{usePoint},#{useCouponCal}, #{cpNum})")
	void insertPayment(PaymentDTO paymentDTO);
	
	@Select("SELECT userNum, SUM(point-usePoint) as totalPoint FROM payment where userNum=${userNum} GROUP BY userNum")
	PointDTO totalPoint(int payNum);
	
	
	
	@Select("select * from payment where payNum=#{payNum}")
	PaymentDTO paymentSelect(int payNum);
	
	@Select("select *  from payment where userNum = #{userNum} order by paynum desc")
	List<PaymentDTO> pointView(int userNum);
	
	
	@Select("SELECT A.payNum, A.userNum, A.ordName, A.ordNum, A.ordColor, A.ordCount, A.ordPrice, A.payDate, A.receiver, A.email, A.phone, A.depositor, A.addr1, A.addr2, A.addr3, A.message, A.bankName, A.payMethod, A.cal, A.point, A.usePoint, A.useCouponCal, B.name, B.id, B.tel FROM  payment A, user_info B WHERE A.userNum = B.userNum and A.userNum = #{userNum} order by paynum desc")
	List<PaymentDTO> myPage(int userNum);
	
	@Select("select * from (SELECT A.payNum, A.userNum, A.ordName, A.ordNum, A.ordColor, A.ordCount, A.ordPrice, A.payDate, A.receiver, A.email, A.phone, A.depositor, A.addr1, A.addr2, A.addr3, A.message, A.bankName, A.payMethod, A.cal, A.point, A.usePoint, A.useCouponCal, B.name, B.id, B.tel FROM  payment A, user_info B WHERE A.userNum = B.userNum and A.userNum = #{userNum} order by paynum desc) where ROWNUM = 1 and userNum=#{userNum}")
	PaymentDTO paymentResult(int userNum);


	
	
}
