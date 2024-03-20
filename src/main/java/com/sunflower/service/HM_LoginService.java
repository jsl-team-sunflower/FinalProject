package com.sunflower.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sunflower.domain.HM_userVO;
import com.sunflower.mapper.HM_Member_mapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class HM_LoginService {
	
	private final HM_Member_mapper memMapper;
	
	public List<HM_userVO> Alluser() { 
		List<HM_userVO> list = memMapper.Alluser();
		return list;
	}

}
