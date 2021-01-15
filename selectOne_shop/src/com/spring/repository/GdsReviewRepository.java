package com.spring.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dto.ReviewDTO;
import com.spring.mapper.GdsMapper;

@Repository
public class GdsReviewRepository {

	 @Autowired
	 private GdsMapper gdsMapper;
	 
	 public List<ReviewDTO> getReviewList(String gdsNum){
		 return gdsMapper.getReviewList(gdsNum);
	 };
	 
	 public void insertReview(ReviewDTO reviewDTO) {
		 gdsMapper.insertReview(reviewDTO);
	 }
		
}
