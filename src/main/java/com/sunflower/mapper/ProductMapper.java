package com.sunflower.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sunflower.domain.ProductVO;

@Mapper
public interface ProductMapper {
	public List<ProductVO> getList();
}
