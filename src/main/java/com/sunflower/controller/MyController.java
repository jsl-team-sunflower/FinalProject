package com.sunflower.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunflower.domain.ProductVO;
import com.sunflower.domain.UserVO;
import com.sunflower.service.ProductService;
import com.sunflower.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/my")
@RequiredArgsConstructor
public class MyController {
	private final ProductService service;
	private final UserService userService;

	
	//localhost:8067/my/mypage
	@GetMapping("/mypage")
	public String myList(Model model) {
		List<ProductVO> list = service.getList();
		model.addAttribute("list",list);
		return "/my/mypage";
	}
	
	@GetMapping("/bidHistory")
	public String bidList(Model model) {
		
		return "/my/bidHistory";
	}
	
	@GetMapping("/payHistory")
	public String payList(Model model) {
		
		return "/my/payHistory";
	}
	@GetMapping("/infoUpdate")
	public String infoUpdateList(Principal principal ,Model model) {
		if(principal != null) {
			UserVO member = userService.findUserInfo(principal.getName());
			model.addAttribute("member",member);
		}
		return "/my/infoUpdate";
	}
	
	
	@GetMapping("/test")
	public String test(Model model) {
		
		return "/test";
	}
	
}

