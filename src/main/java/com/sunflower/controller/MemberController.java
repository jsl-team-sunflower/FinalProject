package com.sunflower.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@RequiredArgsConstructor
@Log4j2
public class MemberController {

	
	@GetMapping("/signup")
	public String signUpForm(String incodeCheck, Model model) {
				return "/member/signup";
		}
	
	
	
	// 로그인 페이지
    @GetMapping("/login")
    public String openLogin() {
        return "/member/login";
    }
    
   
    
  
}










