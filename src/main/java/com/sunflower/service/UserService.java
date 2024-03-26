package com.sunflower.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
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
	public UserVO findUserInfo(String id) {
		UserVO member = userMapper.findUserInfo(id);
		return member;
	}
	public void updateMember(UserVO vo) {
		userMapper.update(vo);
	}
	
	public List<UserVO> wholeUser(){
		List<UserVO> list = userMapper.wholeUser();
		return list;
	}
}
