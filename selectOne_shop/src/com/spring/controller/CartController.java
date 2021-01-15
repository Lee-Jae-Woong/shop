package com.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.dto.payment.CouponInfoDTO;
import com.spring.dto.payment.PaymentDTO;
import com.spring.dto.payment.PointDTO;
import com.spring.dto.user.LoginUserDTO;
import com.spring.dto.user.UserCartDTO;
import com.spring.gds.dto.GdsCartDTO;
import com.spring.gds.dto.GdsOrderDTO;
import com.spring.service.CartService;
import com.spring.service.CouponService;
import com.spring.service.PaymentService;

@Controller
public class CartController {

	@Autowired
	CartService cartService;
	
	@Autowired
	PaymentService paymentService;
	
	@Autowired
	CouponService couponService;

	@Resource(name = "loginUserBean")
	private LoginUserDTO loginUserBean;

	/* 장바구니 가져오기 */
	@GetMapping(value = "/cart")
	public String cart(Model model) {

		int userNum = loginUserBean.getUserNum();
		List<UserCartDTO> CartList = cartService.getGdsList(userNum);

		model.addAttribute("CartList", CartList);

		return "cart";
	}

	/* 장바구니 전체상품 주문 */
	@GetMapping(value = "/cart/order")
	public String order(Model model, GdsCartDTO gdsCartDTO) { // dto -> jsp로 보내는것
		
		int userNum = loginUserBean.getUserNum();
		
		List<UserCartDTO> CartList = cartService.getGdsList(userNum);
		List<PaymentDTO> myPage = paymentService.myPage(userNum);
		model.addAttribute("mp", myPage);
		
		PointDTO totalPoint = paymentService.totalPoint(userNum);
		model.addAttribute("totalPoint", totalPoint);
		
		List<CouponInfoDTO> cpList = couponService.cpList(userNum );
		model.addAttribute("cpList", cpList);

		model.addAttribute("CartList", CartList);

		return "order";
	}
	
//	장바구니 선택주문	
	@GetMapping(value = "/cart/orderSelect")
	public String orderSelect(@RequestParam(value = "num") ArrayList<Integer> cartNums, Model model) {
		
		int userNum = loginUserBean.getUserNum();
		List<PaymentDTO> myPage = paymentService.myPage(userNum);
		List<UserCartDTO> CartList = cartService.orderSelect(cartNums);
		PointDTO totalPoint = paymentService.totalPoint(userNum);
		List<CouponInfoDTO> cpList = couponService.cpList(userNum );
		model.addAttribute("mp", myPage);
		model.addAttribute("CartList", CartList);
		model.addAttribute("totalPoint", totalPoint);
		model.addAttribute("cpList", cpList);
		return "order";
	}
	
	// 장바구니 (x)삭제
	@GetMapping(value = "/cart/delete")
	public String delete(@RequestParam int cartNum, GdsCartDTO gdsCartDTO) {
		gdsCartDTO.setCartNum(cartNum);
		cartService.delete(gdsCartDTO);
		System.out.println("삭제(x) delete 값 : " + gdsCartDTO.getCartNum());
		return "redirect:/cart";

	}

	// 장바구니 비우기
	@GetMapping(value = "/cart/deleteAll")
	public String deleteAll(GdsCartDTO gdsCartDTO) {

		gdsCartDTO.setUserNum(loginUserBean.getUserNum());

		cartService.deleteAll(gdsCartDTO.getUserNum());
		return "redirect:/cart";
	}

//	장바구니 수량 변경
	@GetMapping(value = "/cart/cartUpdate")
	public String cartUpdate(@RequestParam int cartCount, @RequestParam int cartNum, GdsCartDTO gdsCartDTO) {
		System.out.println(cartCount);
		System.out.println(cartNum);
		gdsCartDTO.setCartCount(cartCount);
		gdsCartDTO.setCartNum(cartNum);

		cartService.cartUpdate(gdsCartDTO);
		return "redirect:/cart";

	}

//	장바구니 선택삭제
	@GetMapping(value = "/cart/deleteChoice")
	public String deleteChoice(@RequestParam(value = "num") ArrayList<Integer> cartNums) {
		System.out.println(cartNums);
		System.out.println("con");
		cartService.deleteChoice(cartNums);
		return "redirect:/cart";
	}

 
	

}
