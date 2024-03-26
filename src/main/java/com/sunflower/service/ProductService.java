package com.sunflower.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunflower.common.Criteria;
import com.sunflower.domain.AttachVO;
import com.sunflower.domain.OrderVO;
import com.sunflower.domain.ProductVO;
import com.sunflower.domain.TenderVO;
import com.sunflower.domain.UserVO;
import com.sunflower.mapper.AttachMapper;
import com.sunflower.mapper.ProductMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductService {
	
	private final ProductMapper productmapper;
	private final AttachMapper attachmapper;
	
	@Transactional //의뢰등록
	public void regist(ProductVO vo) {
		productmapper.insertProduct(vo);
		productmapper.startTender(vo);
		if(vo.getAttach()==null||vo.getAttach().size()<=0) {
			return;
		}else {
			vo.getAttach().forEach(attach -> {
				attach.setProductNum(vo.getProductNum());
				attachmapper.insert(attach);
			});
		}
	}//regist()
	
	//상세정보
	public ProductVO viewDetail(int productNum) {
		productmapper.productViewcount(productNum);
		ProductVO vo = productmapper.selectView(productNum);
		List<AttachVO> list = attachmapper.findByNum(productNum);
		vo.setAttach(list);
		return vo;
	}//viewDetail()
	
	//진행경매
	public List<ProductVO> onAuctionList(Criteria cri) {
		List<ProductVO> list = productmapper.onAuctionList(cri);
		for(ProductVO vo : list) {
			int productNum = vo.getProductNum();
			List<AttachVO> alist=attachmapper.findByNum(productNum);
			vo.setAttach(alist);
		}//for문
		return list;
	}//onAuctionList()
	
	//진행경매 수
	public int getOnTotal(Criteria cri) {
		return productmapper.getOnTotal(cri);
	}//getOnTotal()
	
	//경매결과
	public List<ProductVO> resultAuctionList(Criteria cri) {
		List<ProductVO> list = productmapper.resultAuctionList(cri);
		for(ProductVO vo : list) {
			int productNum = vo.getProductNum();
			List<AttachVO> alist=attachmapper.findByNum(productNum);
			vo.setAttach(alist);
		}//for문
		return list;
	}//resultAuctionList()
	
	//경매결과 수
	public int getResultTotal(Criteria cri) {
		return productmapper.getResultTotal(cri);
	}//getResultTotal()
	
	//응찰
	public void tenderPrice(TenderVO vo) {
		productmapper.tenderPrice(vo);
		productmapper.productTendercount(vo);
	}//tenderPrice()
	
	//state 변경
	public void updateState(ProductVO vo) {
		productmapper.updateState(vo);
	}
	
	
	/*
	public List<ProductVO> getList() { //페이지처리 및 모든글 가져오기
		List<ProductVO> list = productmapper.getList();
		for(ProductVO vo : list) {
			int productNum = vo.getProductNum();
			vo.setTenderPrice( productmapper.getTenderList(productNum));  
		}
		return list;
	}
	*/
	//응찰내역
	public List<ProductVO> getList(String id) { //페이지처리 및 모든글 가져오기
		List<ProductVO> list = productmapper.getListId(id);
		for(ProductVO vo : list) {
			int productNum = vo.getProductNum();
			List<AttachVO> alist=attachmapper.findByNum(productNum);
			vo.setAttach(alist);
		}
		return list;
	}
	//등록한 상품내역
	public List<ProductVO> getListWriter(String id) { //페이지처리 및 모든글 가져오기
		List<ProductVO> list = productmapper.getListWriter(id);
		for(ProductVO vo : list) {
			int productNum = vo.getProductNum();
			List<AttachVO> alist=attachmapper.findByNum(productNum);
			vo.setAttach(alist);
		}
		return list;
	}
	//order 등록
	@Transactional 
	public void saveOrder(OrderVO vo) {
		productmapper.insertOrder(vo);
		
	}
	
	//order 조회
	
	public OrderVO getOrder(int orderNum) {
		OrderVO vo = productmapper.orderSelect(orderNum);
		return vo;
	}
	
}
