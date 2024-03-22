package com.sunflower.common;

import java.util.Date;
import java.util.Random;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Component
@RequiredArgsConstructor
@Log4j2

public class MailSenderRunner {
	
	private final JavaMailSender mailSender;
	
	@Value("${spring.mail.username}")
	private String from;
	
	public String sendMail(String mail) {
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		log.info("인증번호 : " + checkNum);
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom(from);
		message.setTo(mail);
		message.setSubject("회원가입 인증 이메일 입니다");
		String content = 
		"안녕하세요! 회원 가입 감사드립니다." + 
		"회원 가입 작업이 진행 중입니다 , 인증 코드 입력 상자에 :" + checkNum + "를 입력하여 작업을 완료해주세요." +
		"참고 :이 작업은 암호를 변경하거나 이메일에 로그인하거나 휴대폰을 바인딩 할 수 있습니다. 혼자서 운영하지 않는 경우 계정 보안을 위해 로그인하고 비밀번호를 제때 변경하십시오." + 
		"(직원이이 인증 코드를 요구하지 않으므로 공개하지 마십시오)";
		message.setText(content);
		message.setSentDate(new Date());
		
		mailSender.send(message);
		
		String num = Integer.toString(checkNum);
		
		return num;
		
	}
	
}
