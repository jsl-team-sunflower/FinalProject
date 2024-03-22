package com.sunflower.service;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunflower.domain.UserVO;
import com.sunflower.mapper.UserMapper;

import lombok.Builder;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
@Builder
public class MyUserDetailsService implements UserDetailsService {
	
	private final UserMapper userMapper;
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	    	// 1. 회원 정보 및 비밀번호 조회
	       UserVO member = userMapper.findByLoginId(username);
	       //String encodedPassword = (member == null) ? "" : member.getPassword();
	        if (member == null) {
	             throw new UsernameNotFoundException(username);
	        }
	       
	 return User.builder()
			 .username(member.getId())
			 .password(member.getPw())
			 .build();
	}

}
