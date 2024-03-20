package com.sunflower.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sunflower.domain.HM_userVO;
import com.sunflower.service.HM_LoginService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@RequiredArgsConstructor
@Log4j2
public class MemberController {

	private final HM_LoginService service;
	
	@GetMapping("/signup")
	public String signUpForm(String incodeCheck, Model model) {
				return "/member/signup";
		}
	
	// 로그인 페이지
    @GetMapping("/login")
    public String Alluser(Model model) {
    	List<HM_userVO> list = service.Alluser();
    	model.addAttribute("list",list);
        return "/member/login";
    }
    
   
    
  
}










