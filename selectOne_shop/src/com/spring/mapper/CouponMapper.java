package com.spring.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.spring.dto.payment.CouponDTO;
import com.spring.dto.payment.CouponInfoDTO;

public interface CouponMapper {

	
	
	

	@Insert("insert into coupon(cpNum, cpCode, userNum,useCp)VALUES(cp_num.nextval,#{cpCode}, #{userNum}, '사용가능')")
	void regCoupon(CouponDTO couponDTO);
	
	@Select("SELECT A.cpNum, A.cpCode, A.userNum, A.useCp, B.mgrCp, B.cpName, B.itemScope, B.cpRate, B.expDate FROM  coupon A, mgrCoupon B WHERE A.cpCode= B.cpCode and A.userNum = #{userNum} and A.useCP='사용가능' order by cpNum desc")
	List<CouponInfoDTO> cpList(int userNum);
	
	@Select("SELECT A.cpNum, A.cpCode, A.userNum, A.useCp, B.mgrCp, B.cpName, B.itemScope, B.cpRate, B.expDate FROM  coupon A, mgrCoupon B WHERE A.cpCode= B.cpCode and A.userNum = #{userNum} order by cpNum desc")
	List<CouponInfoDTO> allCpList(int userNum);
	
	@Select("select cpNum from coupon where cpCode=#{cpCode} and userNum=#{userNum}")
	String existCp(CouponDTO couponDTO);
	
	@Update("UPDATE coupon SET useCp= '사용완료' WHERE  cpNum=#{cpNum } ")
	void updateCp(int cpNum);
	
	

	
}
