package com.sunflower.controller;

import java.security.Principal;
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
import com.sunflower.service.ProductService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/auction")
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
	//의뢰 신청 페이지
	@GetMapping("/regist")
	public String registProduct() {
		return "/Auction/productRegist";
	}//get.registProduct()
	
	//의뢰 신청
	@PostMapping("/regist")
	public String registProductPro(ProductVO product, @RequestParam("uploadfile") MultipartFile[] uploadfile) {
		List<AttachVO> list = fileUploadUtils.uploadFiles(uploadfile);
		product.setAttach(list);
		productService.regist(product);
		return "index";
	}//post.registProduct()
	
	//상세정보
	@GetMapping("/detail")
	public String viewDetail(int productNum, Model model) {
		ProductVO vo = productService.viewDetail(productNum);
		model.addAttribute("vo", vo);		
		return "/Auction/detail";
	}//viewDetail()
	
	//진행경매 리스트
	@GetMapping("/onauction")
	public String onGoingList(Model model, Criteria cri) {
		List<ProductVO> list = productService.onAuctionList(cri);
		int total = productService.getOnTotal(cri);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "/Auction/onGoingAuction";
	}//onGoingList()
	
	//경매결과 리스트
	@GetMapping("/ResultAuction")
	public String resultList(Model model, Criteria cri) {
		List<ProductVO> list = productService.resultAuctionList(cri);
		int total = productService.getResultTotal(cri);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "/Auction/ResultAuction";
	}//resultList()
	
	//입찰
	@PostMapping("/tender")
	@Transactional
	@ResponseBody
	public String tenderPrice(@RequestBody TenderVO vo, Principal principal) {
		vo.setId(principal.getName());
		productService.tenderPrice(vo);
		return "Success";
	}
	
}//
