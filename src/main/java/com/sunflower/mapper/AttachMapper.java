package com.sunflower.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sunflower.domain.AttachVO;

@Mapper
public interface AttachMapper {
	
	public void insert(AttachVO vo);
	public List<AttachVO> findByNum(int productNum);
	
	public void linkInsert(AttachVO Avo);
	
	public AttachVO linkNum(int productNum);
}
