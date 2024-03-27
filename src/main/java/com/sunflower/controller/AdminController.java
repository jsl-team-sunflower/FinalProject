package com.sunflower.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunflower.domain.UserVO;
import com.sunflower.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
	private final UserService userService;
	
	@GetMapping("/admin")
	public String adminList(Model model) {
		List<UserVO> alist = userService.wholeUser();
		model.addAttribute("alist",alist);
		return "/admin/admin";
	}
	
	@GetMapping("/product")
	public String productList(Model model) {
		
		return "/admin/productAdmin";
	}
	
	
}

