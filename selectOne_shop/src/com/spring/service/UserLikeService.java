package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.user.UserLikeDTO;
import com.spring.repository.UserLikeRepository;

@Service
public class UserLikeService {
	
	@Autowired
	private UserLikeRepository userLikeRepository;
	
	//찜하기 추가
	public void addUserLike(UserLikeDTO userLikeDTO) { 
		userLikeRepository.addUserLike(userLikeDTO);
		
	}
	
	public void deleteUserLike(UserLikeDTO userLikeDTO) {
		userLikeRepository.deleteUserLike(userLikeDTO);
	}
	
	public boolean getUserLikeGds(int num, int userNum) {
		return userLikeRepository.getUserLikeGds(num,userNum);
	}
	
	public List<Integer> getUserLikeGdsList(int userNum){
		return userLikeRepository.getUserLikeGdsList(userNum);
	}

	//home에서 찜 목록 불러오기
	public List<UserLikeDTO> getUserLikeList(int userNum){
		return userLikeRepository.getUserLikeList(userNum);
	
	}
	
	public int getUserLikeCount(int userNum) {
		return userLikeRepository.getUserLikeCount(userNum);
	}

}
