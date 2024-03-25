package com.sunflower.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.sunflower.domain.OrderVO;
import com.sunflower.domain.ProductVO;
import com.sunflower.domain.UserVO;
import com.sunflower.service.ProductService;
import com.sunflower.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/pay")
@RequiredArgsConstructor
public class PayController {
	private final ProductService productService;
	private final UserService userService;
	
	@GetMapping("/page")
	public String payList(String id,int productNum,Model model) {
		ProductVO vo = productService.viewDetail(productNum);
		UserVO user = userService.findUserInfo(id);
		model.addAttribute("vo", vo);
		model.addAttribute("user",user);
		return "/pay/pay";
	}
	
	@PostMapping("/order")
	public String orderList(OrderVO order,Model model) {
		 productService.saveOrder(order);
		 OrderVO vo =productService.getOrder(order.getOrderNum());
		 ProductVO product = productService.viewDetail(order.getProductNum());
		 model.addAttribute("vo",vo);
		 model.addAttribute("product",product);
		return "/pay/orderComplete";
	}
	
	
	

	
}

