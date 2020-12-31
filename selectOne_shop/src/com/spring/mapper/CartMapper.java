package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.spring.dto.user.UserCartDTO;
import com.spring.gds.dto.GdsCartDTO;
import com.spring.gds.dto.GdsOrderDTO;

public interface CartMapper {

	@Select("SELECT cartNum,userNum,c.gdsNum,cartCount,gdsname,gdsprice,cartColor,thumbImg FROM user_cart c left outer join gds_info g on c.gdsnum = g.gdsnum where c.usernum = #{userNum}")
	List<UserCartDTO> getGdsList(int userNum);

	// @Select("select * from user_cart where usernum=#{userNum}")
	// List<GdsCartDTO> getGdsList(GdsCartDTO gdsCartDTO);
	//
	@Insert("insert into user_cart values(cart_num.nextval,#{userNum},#{gdsNum},#{cartCount},#{cartColor})")
	void addCart(GdsCartDTO gdsCartDTO);
	
	@Delete("delete user_cart where cartnum= #{cartNum}")
	void delete(GdsCartDTO gdsCartDTO);
	
	@Delete("delete user_cart where cartnum= #{cartNum}")
	void deleteOne(int cartNum);
	
	@Delete("delete user_cart where usernum = #{userNum}")
	void deleteAll(long userNum);

	@Update("update user_cart set cartcount = #{cartCount} where cartnum = #{cartNum}")
	void cartUpdate(GdsCartDTO gdsCartDTO);
	
	@Delete("delete user_cart where cartnum= #{cartNum}")
	void deleteChoice(int cartNum);
	
	@Select("select cartNum,userNum,c.gdsNum,cartCount,gdsname,gdsprice,cartColor,thumbImg from user_cart c left outer join gds_info g on c.gdsnum = g.gdsnum where c.cartNum = #{cartNum}")
	List<UserCartDTO> orderSelect(int cartNum);
	
	@Select("select count(*) from user_cart where userNum = #{userNum}")
	int getCartCount(int userNum);
	
}
