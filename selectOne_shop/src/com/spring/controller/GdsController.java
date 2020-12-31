package com.spring.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.dto.ReviewDTO;
import com.spring.dto.payment.CouponInfoDTO;
import com.spring.dto.payment.PaymentDTO;
import com.spring.dto.payment.PointDTO;
import com.spring.dto.user.LoginUserDTO;
import com.spring.gds.dto.GdsOrderDTO;
import com.spring.service.CouponService;
import com.spring.service.GdsService;
import com.spring.service.MgrCouponService;
import com.spring.service.OrderService;
import com.spring.service.PaymentService;
import com.spring.service.ReviewService;
import com.spring.service.UserLikeService;

@Controller
public class GdsController {

	@Autowired
	private OrderService orderService;

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private GdsService gdsService;

	@Autowired
	private UserLikeService userLikeService;
	
	@Autowired
	PaymentService paymentService;
	
	@Autowired
	MgrCouponService mgrCouponService;
	
	@Autowired
	CouponService couponService;

	@Resource(name = "loginUserBean")
	private LoginUserDTO loginUserBean;

	// 상품 페이지
	@GetMapping(value = "/shop")
	public String shop(@RequestParam(value = "gds") String gdsNum, Model model) {
		boolean userLikeGds;
		int num = Integer.parseInt(gdsNum);
		int gdsStock = gdsService.getGdsStock(gdsNum);

		if (loginUserBean.isCheck() == true) {
			userLikeGds = userLikeService.getUserLikeGds(num, loginUserBean.getUserNum());
			model.addAttribute("UserLikeGds", userLikeGds);

		} else {
			userLikeGds = false;
			model.addAttribute("UserLikeGds", userLikeGds);

		}
		
		model.addAttribute("GdsDetail", gdsService.getGdsDetail(gdsNum));
		List<ReviewDTO> reviewList = reviewService.getReviewList(gdsNum);
		model.addAttribute("ReviewList", reviewList);

		return "shop";
	}
	
	@PostMapping(value = "/order")
	public String order(@ModelAttribute("ordDto") PaymentDTO paymentDTO, GdsOrderDTO ordDto,  Model model) {

		//List<GdsCartDTO> cartList = orderService.getGdsList(); // 임시 행 최종에는 지울것
		//model.addAttribute("CartList", cartList);// 임시 행 최종에는 지울것
		
		model.addAttribute("OrdDto", ordDto);
		
		int userNum = loginUserBean.getUserNum();
		List<PaymentDTO> myPage = paymentService.myPage(userNum);
		model.addAttribute("mp", myPage);
		
		PointDTO totalPoint = paymentService.totalPoint(userNum);
		model.addAttribute("totalPoint", totalPoint);
		
		List<CouponInfoDTO> cpList = couponService.cpList(userNum );
		model.addAttribute("cpList", cpList);
		
		
		return "order";
	}

	

}
