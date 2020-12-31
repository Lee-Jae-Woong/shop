package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.spring.dto.ReviewDTO;
import com.spring.gds.dto.GdsDetailDTO;
import com.spring.gds.dto.GdsInfoDTO;

public interface GdsMapper {
	
	@Select("select rvNum, gdsNum, id, rvText, rvImg, rvDate, rvScore from gds_review where gdsNum = #{gdsNum}")
	List<ReviewDTO> getReviewList(String gdsNum);

	@Insert("insert into gds_review(rvNum, gdsNum, id, rvText, rvImg, rvDate, rvScore) "
			+ "values(gds_review_seq.nextval,#{gdsNum},#{id},#{rvText},#{rvImg},sysdate,#{rvScore})")
	void insertReview(ReviewDTO reviewDTO);
	
	@Select("select a.gdsNum, a.gdsName , b.cateName, a.gdsPrice , a.gdsStock, a.thumbImg, count(c.gdsNum) as review_count " + 
			"from gds_info a " + 
			"left join gds_review c on a.gdsNum=c.gdsNum " + 
			"left join cate_info b on a.catecode=b.catecode " + 
			"group by a.gdsNum, a.gdsName, b.cateName, a.gdsPrice, a.gdsStock, a.thumbImg " + 
			"order by a.gdsNum")
	List<GdsInfoDTO> getAllGdsList();
	
	@Select("select a.gdsNum, a.gdsName, a.gdsColor, a.gdsDetail , b.cateName, a.gdsPrice , a.gdsStock, a.thumbImg, count(c.gdsNum) as review_count " + 
			"from gds_info a " + 
			"left join gds_review c on a.gdsNum=c.gdsNum " + 
			"left join cate_info b on a.catecode=b.catecode " +
			"WHERE LOWER(gdsName) like LOWER('%'|| #{keyword} ||'%') or  gdsColor like '%'|| #{keyword} ||'%' or gdsDetail like '%'|| #{keyword} ||'%' " +
			"group by a.gdsNum, a.gdsName, b.cateName, a.gdsPrice, a.gdsStock, a.thumbImg, a.gdsColor, a.gdsDetail " + 
			"order by a.gdsNum")
	List<GdsInfoDTO> searchResult(String keyword);
	
	@Select("select a.gdsNum, a.gdsName, b.cateName, a.gdsPrice, a.gdsColor, a.gdsStock, a.gdsDetail, a.gdsImg, a.thumbImg, a.gdsDesc, review_count " + 
			"from (select count(*) as review_count from gds_review where gdsNum=#{gdsNum}),gds_info a,cate_info b where a.gdsNum=#{gdsNum} and a.catecode=b.catecode")
	GdsDetailDTO getGdsDetail(String gdsNum);
	
	@Select("select gdsStock from gds_info where gdsNum=#{gdsNum}")
	int getGdsStock(String gdsNum);
	
	@Update("update gds_info set gdsstock = #{count} where gdsNum=#{gdsNum}")
	void updateStock(@Param("gdsNum") String gdsNum , @Param("count") int count);

}
