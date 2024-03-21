package com.sunflower.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunflower.domain.UserVO;
import com.sunflower.mapper.UserMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@RequiredArgsConstructor
@Log4j2
public class UserService {

	private final UserMapper userMapper;
	private final PasswordEncoder passwordEncoder;

	
	public int countMemberByLoginId(final String id) {
		return userMapper.countByLoginId(id);
	}
	
	@Transactional 
	public String saveMember(UserVO vo) {
		vo.setPw(passwordEncoder.encode(vo.getPw()));
		vo.setAddress(vo.getUser_addressNumber() + vo.getUser_address1() + vo.getUser_address2());
		userMapper.save(vo);
		return vo.getId();
	}
	
	public UserVO findMemberByLoginId(final String id, final String pw) {
		//1. 회원정보 및 비밀번호 조회
		UserVO member = userMapper.findByLoginId(id);
		String encodedPassword = (member == null) ? "" : member.getPw();
		System.out.println("-------------" + encodedPassword);
		// 2. 회원 정보 및 비밀번호 체크
		if(member == null || passwordEncoder.matches(pw, encodedPassword) == false) {
			return null;
		}
		// 3. 회원 응답 객체에서 비밀번호를 제거한 후 회원 정보 리턴
		return member; 
	}
}
