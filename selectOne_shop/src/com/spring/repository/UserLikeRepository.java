package com.spring.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dto.user.UserLikeDTO;
import com.spring.mapper.UserMapper;

@Repository
public class UserLikeRepository {

	@Autowired
	private UserMapper userMapper;

	public void addUserLike(UserLikeDTO userLikeDTO) {
		userMapper.addUserLike(userLikeDTO);
	}

	public void deleteUserLike(UserLikeDTO userLikeDTO) {
		userMapper.deleteUserLike(userLikeDTO);

	}

	public boolean getUserLikeGds(int num, int userNum) {
		System.out.println("dao.getUserLikeGds" + userMapper.getUserLikeGds(num, userNum));
		if (userMapper.getUserLikeGds(num, userNum) > 0) {
			return true;
		}
		return false;
	}

	public List<Integer> getUserLikeGdsList(int userNum) {
		return userMapper.getUserLikeGdsList(userNum);
	}

	public List<UserLikeDTO> getUserLikeList(int userNum) {
		return userMapper.getUserLikeList(userNum);
	}
	public int getUserLikeCount(int userNum) {
		return userMapper.getUserLikeCount(userNum);
	}
}
