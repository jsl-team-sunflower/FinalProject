package com.sunflower.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sunflower.common.Criteria;
import com.sunflower.domain.OrderVO;
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
	
	//짧은 경매
	public void shortinsertProduct(ProductVO vo);
	public void shortstartTender(ProductVO vo);
	
	//shortAuction 페이지 불러오기
	public List<ProductVO> shortAuctionList(Criteria cri);
	//getshortTotal
	public int getShortTotal(Criteria cri);
	
	//라이브 경매 등록
	public void liveinsertProduct(ProductVO vo);
	public void livestartTender(ProductVO vo);
	public int linkNum();
	
	//liveAuction 페이지 불러오기
	public List<ProductVO> liveAuctionList(Criteria cri);
	//getLiveTotal
	public int getLiveTotal(Criteria cri);
	
	//----------------------------------------------------------------------------------------------
	
	//tender
	public void tenderPrice(TenderVO vo);
	public void productTendercount(TenderVO vo);
	
	//state 변경
	public void updateState(ProductVO vo);
	
	public List<ProductVO> getList();
	
	public String getTenderList(int productNum);
	//tender를 list에 담음
	public List<TenderVO> TenderList(int productNum);
	
	//username으로 tender 불러오기
	public String getTenderListId(String id);
	
	//tender의 id로 product 불러오기
	public List<ProductVO> getListId(String id);
	
	public List<ProductVO> getListWriter(String id);

	//order 등록
	public void insertOrder (OrderVO order);
	//order 조회
	public OrderVO orderSelect(int orderNum);
	
	//order 결제된 주문
	public List<ProductVO> orderPaySelect(String id);
	
	
}
