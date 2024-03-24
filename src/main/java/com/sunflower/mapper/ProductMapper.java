package com.sunflower.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sunflower.common.Criteria;
import com.sunflower.domain.ProductVO;
import com.sunflower.domain.TenderVO;

@Mapper
public interface ProductMapper {
	
	//의뢰 등록
	public void insertProduct(ProductVO vo);
	public void startTender(ProductVO vo);
	
	//상세 페이지 불러오기
	public ProductVO selectView(int productNum);
	//viewcount + 1
	public void productViewcount(int productNum);
	
	//onAuction 페이지 불러오기
	public List<ProductVO> onAuctionList(Criteria cri);
	//getOnTotal
	public int getOnTotal(Criteria cri);
	
	//resultAuction 페이지 불러오기
	public List<ProductVO> resultAuctionList(Criteria cri);
	//getResultTotal
	public int getResultTotal(Criteria cri);
	
	//tender
	public void tenderPrice(TenderVO vo);
	
	public List<ProductVO> getList();
	
	public String getTenderList(int productNum);
	
	//username으로 tender 불러오기
	public String getTenderListId(String id);
	
	//tender의 id로 product 불러오기
	public List<ProductVO> getListId(String id);
	
	public List<ProductVO> getListWriter(String id);
	
	
}
