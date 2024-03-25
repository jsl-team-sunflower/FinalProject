package com.sunflower.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunflower.common.MailSenderRunner;
import com.sunflower.domain.UserVO;
import com.sunflower.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@RequiredArgsConstructor
@Log4j2
public class MemberController {

	private final MailSenderRunner mailSenderRunner;
	private final UserService userService;
//	--------------email 인증번호----------------------
	@GetMapping("/signup")
	public String signUpForm(String incodeCheck, Model model) {
		return "/member/signup";
	}

	String checkIncode = "";

	@GetMapping("/mail.do")
	@ResponseBody
	public String mailSend(String mail) {
		checkIncode = mailSenderRunner.sendMail(mail);
		return checkIncode;
	}
	
	
//	------------회원관리----------------
	
	@PostMapping("/signup")
	public String userMember(UserVO vo, Model model) {
		userService.saveMember(vo);
		return "redirect:/login";
	}
	@PostMapping("/user/update")
	public String userUpdateMember(UserVO vo, Model model) {
		
		userService.updateMember(vo);
		return "index";
	}
	
	// 로그인 페이지
	@GetMapping("/login")
	public String openLogin() {
		return "/member/login";
	}
	
	//ID중복 확인
	@ResponseBody
	@GetMapping("/member-count")
	public int countMemberByLoginId(@RequestParam String id) {
		return userService.countMemberByLoginId(id);
	}
}
