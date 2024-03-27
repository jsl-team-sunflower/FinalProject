package com.sunflower.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sunflower.common.Criteria;
import com.sunflower.common.FileUploadUtils;
import com.sunflower.common.PageDTO;
import com.sunflower.domain.AttachVO;
import com.sunflower.domain.ProductVO;
import com.sunflower.domain.TenderVO;
import com.sunflower.mapper.AttachMapper;
import com.sunflower.service.ProductService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@RequiredArgsConstructor
@RequestMapping("/auction")
@Log4j2
public class ProductController {

	private final ProductService productService;
	private final FileUploadUtils fileUploadUtils;

	@GetMapping("/main")
	public String main(Criteria cri, Model model) {
		List<ProductVO> onAuction = productService.onAuctionList(cri);
		List<ProductVO> resultAuction = productService.resultAuctionList(cri);
		model.addAttribute("on", onAuction);
		model.addAttribute("re", resultAuction);
		return "index";
	}

	// 의뢰 신청 페이지
	@GetMapping("/regist")
	public String registProduct() {
		return "/Auction/productRegist";
	}// get.registProduct()

	// 의뢰 신청
	@PostMapping("/regist")
	public String registProductPro(ProductVO product, @RequestParam("uploadfile") MultipartFile[] uploadfile) {
		List<AttachVO> list = fileUploadUtils.uploadFiles(uploadfile);
		product.setAttach(list);
		productService.regist(product);
		return "index";
	}// post.registProduct()

	// 짧은 경매 의뢰 신청 페이지
	@GetMapping("/short")
	public String shortProduct() {
		return "/Auction/shortProductRegist";
	}// get.registProduct()

	// 짧은 경매 의뢰 신청기능
	@PostMapping("/shortpost")
	public String shortregistProduct(ProductVO product, @RequestParam("uploadfile") MultipartFile[] uploadfile) {
		List<AttachVO> list = fileUploadUtils.uploadFiles(uploadfile);
		product.setAttach(list);
		productService.shortRegist(product);
		return "index";
	}// post.registProduct()
	
	// 라이브 경매 의뢰 신청 페이지
		@GetMapping("/live")
		public String liveProduct() {
			return "/Auction/liveProductRegist";
		}// get.registProduct()

		// 라이브 경매 의뢰 신청기능
		@PostMapping("/livepost")
		public String liveregistProduct(ProductVO product, @RequestParam("link") String link, AttachVO Avo) {
			Avo.setUploadFile(link);		// 링크를 AttachVo 에 저장
			Avo.setProductNum(product.getProductNum());
			product.setAttachVO(Avo);		// link 만 저장된 AttachVO를 Product에 저장
			
			productService.liveRegist(product);		// 그 프로덕트를 insert 하는 
			return "index";
		}// post.registProduct()

	//----------------------------------------------------------------------------------------------
	
	// 상세정보
	@GetMapping("/detail")
	public String viewDetail(int productNum, Model model) {
		ProductVO vo = productService.viewDetail(productNum);
		model.addAttribute("vo", vo);
		return "/Auction/detail";
	}// viewDetail()

	// 짧은 경매 상세정보
	@GetMapping("/shortProductDetail")
	public String shortviewDetail(@RequestParam int productNum, Model model) {
		ProductVO vo = productService.viewDetail(productNum);
		List<TenderVO> Tlist = productService.TenderList(productNum);
		List<Integer> Ilist = new ArrayList<Integer>();
		for (TenderVO Tvo : Tlist) {
			String str = Tvo.getTenderPrice();
			int num = Integer.parseInt(str.replaceAll(",", "").trim());
			Ilist.add(num);
		}
		model.addAttribute("vo", vo);
		model.addAttribute("Tlist", Tlist);
		model.addAttribute("Ilist", Ilist);
		return "/Auction/shortProductDetail";
	}
	
	// 짧은 경매 상세정보
	@GetMapping("/liveProductDetail")
	public String liveviewDetail(@RequestParam int productNum, Model model) {
		ProductVO vo = productService.viewDetail(productNum);
		AttachVO aaavo =  productService.linkNum(productNum);
		model.addAttribute("vo", vo);
		model.addAttribute("avo", aaavo);
		return "/Auction/liveDetail";
	}

	//-----------------------------------------------------------------------------------------------
	
	// 진행경매 리스트
	@GetMapping("/onauction")
	public String onGoingList(Model model, Criteria cri) {
		List<ProductVO> list = productService.onAuctionList(cri);
		int total = productService.getOnTotal(cri);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "/Auction/onGoingAuction";
	}// onGoingList()

	// 짧은 경매 리스트
	@GetMapping("/ShortAuction")
	public String ShortList(Model model, Criteria cri) {
		List<ProductVO> list = productService.shortAuctionList(cri);
		int total = productService.getShortTotal(cri);
		model.addAttribute("shortlist", list);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "/Auction/ShortAuction";
	}// shortList()
	
	// 라이브 경매 리스트
	@GetMapping("/liveAuction")
	public String liveList(Model model, Criteria cri) {
		List<ProductVO> list = productService.liveAuctionList(cri);
		int total = productService.getLiveTotal(cri);
		model.addAttribute("livelist", list);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "/Auction/LiveAuction";
	}// shortList()
	
	// 경매결과 리스트
	@GetMapping("/ResultAuction")
	public String resultList(Model model, Criteria cri) {
		List<ProductVO> list = productService.resultAuctionList(cri);
		int total = productService.getResultTotal(cri);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "/Auction/ResultAuction";
	}// resultList()

	//-----------------------------------------------------------------------------------------------

	// 입찰
	@PostMapping("/tender")
	@Transactional
	@ResponseBody
	public String tenderPrice(@RequestBody TenderVO vo, Principal principal) {
		vo.setId(principal.getName());
		productService.tenderPrice(vo);
		return "Success";
	}

	
}//
