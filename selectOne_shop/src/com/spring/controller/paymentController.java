package com.spring.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.dto.payment.CouponDTO;
import com.spring.dto.payment.CouponInfoDTO;
import com.spring.dto.payment.MgrCouponDTO;
import com.spring.dto.payment.PaymentDTO;
import com.spring.dto.user.LoginUserDTO;
import com.spring.service.CartService;
import com.spring.service.CouponService;
import com.spring.service.GdsService;
import com.spring.service.MgrCouponService;
import com.spring.service.OrderService;
import com.spring.service.PaymentService;


@Controller
public class paymentController {
	
	
	@Autowired
	OrderService orderService;
	@Autowired
	PaymentService paymentService;
	@Autowired
	MgrCouponService mgrCouponService;
	@Autowired
	CouponService couponService;
	@Autowired
	CartService cartService;
	@Autowired
	GdsService gdsService;

	@Resource(name = "loginUserBean")
	private LoginUserDTO loginUserBean;
	
	/* 상품 결제하기 */
	@PostMapping(value = "/payment")
	public String payment(@ModelAttribute("paymentDTO") PaymentDTO paymentDTO,@RequestParam(defaultValue="fail") String cartNum, 
			@RequestParam(value="ordCount" ,defaultValue="") String cartCount,@RequestParam(value="gdsNum",defaultValue="") String gdsNum) {
		
		
		String[] cartCounts = cartCount.split(","); 
		String[] gdsNums = gdsNum.split(","); 

		if(!cartNum.equals("fail")) {
			String[] arrCartNums = cartNum.split(",");
			for(String cn : arrCartNums) { 
				cartService.deleteOne(Integer.parseInt(cn)); 
				}
		
		}
		  int index = 0; 
		  for(String gn : gdsNums) {
			  int gdsStock = gdsService.getGdsStock(gn);
			  int selStock = Integer.parseInt(cartCounts[index]);
			  int result = gdsStock-selStock;
			
			  gdsService.updateStock(gn,result); 
			  index++; 
			  }
		
		
		paymentService.insertPayment(paymentDTO);
		
		int cpNum = paymentDTO.getCpNum();
		couponService.updateCp(cpNum);
		
		
		return "redirect:/paymentResult";
		
		
		
	}

	@RequestMapping(value = "/paymentResult", method = { RequestMethod.POST, RequestMethod.GET })
	public String paymentResult(Model model) {

		int userNum = loginUserBean.getUserNum();
		PaymentDTO paymentResult = paymentService.paymentResult(userNum);
		model.addAttribute("pm", paymentResult);

		return "paymentResult";
	}

	@RequestMapping(value = "/paymentView", method = { RequestMethod.POST, RequestMethod.GET })
	public String paymentSelect(@ModelAttribute("paymentDTO") PaymentDTO paymentDTO, Model model) {

		int payNum = paymentDTO.getPayNum();
		PaymentDTO paymentSelect = paymentService.paymentSelect(payNum);
		model.addAttribute("pm", paymentSelect);

		return "paymentView";
	}



	@RequestMapping(value = "/paymentViewAll", method = { RequestMethod.POST, RequestMethod.GET })
	public String paymentViewAll(Model model) {

		int userNum = loginUserBean.getUserNum();
		List<PaymentDTO> myPage = paymentService.myPage(userNum);
		model.addAttribute("mp", myPage);

		return "paymentViewAll";
	}
	
	@RequestMapping(value = "/couponPage", method = { RequestMethod.POST, RequestMethod.GET })
	public String allCpList(Model model) {

		
		int userNum = loginUserBean.getUserNum();
		List<CouponInfoDTO> allCpList = couponService.allCpList(userNum);
		model.addAttribute("allCpList", allCpList);

		return "couponPage";
	}
	
	@PostMapping(value = "/regCoupon")
	public String regCoupon(@ModelAttribute("couponDTO") CouponDTO couponDTO,@ModelAttribute("mgrCouponDTO") MgrCouponDTO mgrCouponDTO, HttpSession session) {

		int userNum = loginUserBean.getUserNum();
		String cpCode = couponDTO.getCpCode();
		
		String check = couponService.existCp(couponDTO);
		String checkCpCode = mgrCouponService.checkCpCode(mgrCouponDTO);
		
		if(checkCpCode != null) {
			if(check==null){
				
				couponService.regCoupon(couponDTO);
				return "redirect:/couponPage";
				
			}else {
				
				return "redirect:/couponPage";
			}
		} else {
			return "redirect:/couponPage";
		}
		
	}

	@RequestMapping(value = "/pointView", method = { RequestMethod.POST, RequestMethod.GET })
	public String stackPoint(Model model) {

		int userNum = loginUserBean.getUserNum();
		List<PaymentDTO> pointView = paymentService.pointView(userNum);
		model.addAttribute("pointView", pointView);
		
		
		return "pointView";
	}

}
