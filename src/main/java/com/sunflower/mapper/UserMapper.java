package com.sunflower.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sunflower.domain.UserVO;

import lombok.extern.log4j.Log4j2;

@Mapper
public interface UserMapper {
	
	int countByLoginId(String id); //갯수 구하는 거
	
	void save(UserVO vo); // 저장하는 거
	
	void update(UserVO vo);
	
	UserVO findByLoginId(String id); // 아이디 비번 중복 확인하는 거
	
	UserVO findUserInfo(String id);
	
	List<UserVO> wholeUser();
}
