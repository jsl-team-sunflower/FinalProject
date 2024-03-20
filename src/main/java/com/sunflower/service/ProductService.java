package com.sunflower.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sunflower.domain.ProductVO;
import com.sunflower.mapper.ProductMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductService {
	private final ProductMapper mapper;
	
	public List<ProductVO> getList() { //페이지처리 및 모든글 가져오기
		List<ProductVO> list = mapper.getList();
		return list;
	}
}
