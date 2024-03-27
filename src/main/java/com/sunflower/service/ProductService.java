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
	
	@Transactional //짧은 경매등록
	public void shortRegist(ProductVO vo) {
		productmapper.shortinsertProduct(vo);
		productmapper.shortstartTender(vo);
		
		if(vo.getAttach()==null||vo.getAttach().size()<=0) {
			return;
		}else {
			vo.getAttach().forEach(attach -> {
				attach.setProductNum(vo.getProductNum());
				attachmapper.insert(attach);
			});
		}
	}//shortRegist()
	
	@Transactional //라이브 경매등록
	public void liveRegist(ProductVO vo) {
		productmapper.liveinsertProduct(vo);		
		productmapper.livestartTender(vo);			
		int num = productmapper.linkNum();				
		
		AttachVO aavo = vo.getAttachVO();
		aavo.setProductNum(num);
		vo.setAttachVO(aavo);
		attachmapper.linkInsert(aavo);
		
		
		if(vo.getAttachVO()==null) {
			return;
		}
	}
	
	public AttachVO linkNum(int num) {
		AttachVO avo = attachmapper.linkNum(num);
		return avo;
	}
	
	//liveRegist()
	
	//----------------------------------------------------------------------------------------------
	
	//상세정보
	public ProductVO viewDetail(int productNum) {
		productmapper.productViewcount(productNum);
		ProductVO vo = productmapper.selectView(productNum);
		List<AttachVO> list = attachmapper.findByNum(productNum);
		vo.setAttach(list);
		return vo;
	}//viewDetail()
	
	//----------------------------------------------------------------------------------------------
	
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
	
	//짧은경매
	public List<ProductVO> shortAuctionList(Criteria cri) {
		List<ProductVO> list = productmapper.shortAuctionList(cri);
		for(ProductVO vo : list) {
			int productNum = vo.getProductNum();
			List<AttachVO> alist=attachmapper.findByNum(productNum);
			vo.setAttach(alist);
		}//for문
		return list;
	}//shortAuctionList()
	
	//진행경매 수
	public int getShortTotal(Criteria cri) {
		return productmapper.getShortTotal(cri);
	}//getShortTotal()
	
	//라이브 경매
		public List<ProductVO> liveAuctionList(Criteria cri) {
			List<ProductVO> list = productmapper.liveAuctionList(cri);
			for(ProductVO vo : list) {
				int productNum = vo.getProductNum();
				List<AttachVO> alist=attachmapper.findByNum(productNum);
				vo.setAttach(alist);
			}//for문
			return list;
		}//liveAuctionList()
		
		//진행경매 수
		public int getLiveTotal(Criteria cri) {
			return productmapper.getLiveTotal(cri);
		}//getLiveTotal()

	//----------------------------------------------------------------------------------------------
		
	//tender를 list에 담음
	public List<TenderVO> TenderList(int productNum) { //페이지처리 및 모든글 가져오기
		List<TenderVO> list = productmapper.TenderList(productNum);
		return list;
	}
	
	//----------------------------------------------------------------------------------------------
	
	//응찰
	public void tenderPrice(TenderVO vo) {
		productmapper.tenderPrice(vo);
		productmapper.productTendercount(vo);
	}//tenderPrice()
	
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
