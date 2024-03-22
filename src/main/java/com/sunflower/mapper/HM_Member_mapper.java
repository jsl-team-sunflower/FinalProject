package com.sunflower.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sunflower.domain.HM_userVO;

@Mapper
public interface HM_Member_mapper {
	
	public List<HM_userVO> Alluser();
}