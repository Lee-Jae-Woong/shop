package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.ReviewDTO;
import com.spring.repository.GdsReviewRepository;

@Service
public class ReviewService {
	
	@Autowired
	GdsReviewRepository gdsReviewRepository; //db
	
	public void addReview(ReviewDTO reviewDTO) {
		gdsReviewRepository.insertReview(reviewDTO);
	};
	
	public List<ReviewDTO> getReviewList(String gdsNum){
		return gdsReviewRepository.getReviewList(gdsNum);
	};
}
