package com.spring.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.spring.dto.user.IdSearchUserDTO;
import com.spring.dto.user.LoginDTO;
import com.spring.dto.user.LoginUserDTO;
import com.spring.dto.user.PwPermuteDTO;
import com.spring.dto.user.PwSearchDTO;
import com.spring.dto.user.UserDTO;
import com.spring.dto.user.UserInfoModifyDTO;
import com.spring.dto.user.UserLikeDTO;
import com.spring.dto.user.UserModifyDTO;

public interface UserMapper {

	@Select("select id from user_info where id = #{id}")
	String checkUserId(String id);

	@Insert("insert into user_info(userNum, name, id, pw, email, tel, data, mAddr, lAddr, dlAddr)\r\n" + 
  		"VALUES(user_num.nextval,#{name},#{id},#{pw1},#{email},#{tel},sysdate,#{mAddr},#{lAddr},#{dlAddr})")
	void insertUserInfo(UserDTO userDTO);
  
	@Select("select userNum, name, id, email, tel, data, mAddr, lAddr, dlAddr from user_info where id=#{id}")
	LoginUserDTO loginSelect(LoginDTO loginUserDTO);
  
	@Select("select pw from user_info where id=#{id}")
	String selectLoginPw(LoginDTO loginUserDTO);
  
	@Update("update user_info set lastData = sysdate where id = #{id}")
	void lastLogin(LoginDTO loginUserDTO);
	
	@Select("select id from user_info where name = #{name} and email = #{email} and tel = #{tel}")
	String idSearch(IdSearchUserDTO idsearchUserDTO);
	
	@Select("select pw from user_info where id=#{id} and email = #{email} and tel = #{tel}")
	String pwSearch(PwSearchDTO pwsearchUserDTO);
	
	@Select("select pw from user_info where id=#{id}")
	String selectSearchPw(PwPermuteDTO pwPermuteUserDTO);
	
	@Update("update user_info set pw = #{pw1} where id = #{id} and email = #{email} and tel = #{tel}")
	void pwUpdate(PwPermuteDTO pwPermuteUserDTO);
	
	@Select("select pw from user_info where id = #{id}")
	String selectModifyPw(UserModifyDTO userModifyDTO);
	
	@Update("update user_info set pw = #{pw1}, email = #{email},tel = #{tel} ,mAddr = #{mAddr},lAddr = #{lAddr} ,dlAddr = #{dlAddr} where userNum = #{userNum}")
	void infoUpdate(UserInfoModifyDTO userInfoModifyDTO);
	
	@Delete("Delete from user_info where userNum = #{userNum}")
	void infoDelete(int userNum);
	
	@Insert("insert into user_like(likeNum,gdsNum,userNum) values(user_like_seq.nextval,#{gdsNum},#{userNum})")
	void addUserLike(UserLikeDTO userLikeDTO);
	
	@Delete("delete from user_like where gdsNum=#{gdsNum} and userNum=#{userNum}")
	void deleteUserLike(UserLikeDTO userLikeDTO);
	
	@Select("SELECT count(*) from user_like where gdsNum=#{num} and userNum=#{userNum}")
	int getUserLikeGds(@Param("num") int num,@Param("userNum") int userNum);
	
	@Select("SELECT count(*) from user_like where userNum=#{userNum}")
	int getUserLikeCount(@Param("userNum") int userNum);
	
	@Select("select gdsNum from user_like where userNum = #{userNum} order by gdsNum")
	List<Integer> getUserLikeGdsList(int userNum);
	
	@Select("select a.gdsNum, b.thumbImg,b.gdsName from user_like a,gds_info b where a.gdsNum=b.gdsNum and userNum=#{userNum} order by a.gdsNum")
	List<UserLikeDTO> getUserLikeList(int userNum);
	
}
