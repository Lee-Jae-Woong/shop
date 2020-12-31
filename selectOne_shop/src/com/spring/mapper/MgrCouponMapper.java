package com.spring.mapper;



import org.apache.ibatis.annotations.Select;

import com.spring.dto.payment.MgrCouponDTO;

public interface MgrCouponMapper {

	
	
	 @Select("select * from mgrCoupon where cpCode = #{cpCode}")
	 MgrCouponDTO cpCodeSelect(String cpCode);

	
	@Select("select cpCode from mgrCoupon where cpCode = #{cpCode} and cpCode2 = #{cpCode2} and cpCode3 = #{cpCode3} and cpCode4 = #{cpCode4}")
	String checkCpCode(MgrCouponDTO mgrCouponDTO);
	
	
}
