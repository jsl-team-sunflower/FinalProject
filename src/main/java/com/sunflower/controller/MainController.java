package com.sunflower.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sunflower.common.Criteria;
import com.sunflower.domain.ProductVO;
import com.sunflower.service.ProductService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MainController {
	
	private final ProductService productService;
	
	@GetMapping("/")
	public String main(Model model, Criteria cri) {
		List<ProductVO> onAuction = productService.onAuctionList(cri);
		List<ProductVO> resultAuction = productService.resultAuctionList(cri);
		List<ProductVO> shortAuctionList = productService.shortAuctionList(cri);
		List<ProductVO> liveAuctionList = productService.liveAuctionList(cri);
		model.addAttribute("on", onAuction);
		model.addAttribute("re", resultAuction);
		model.addAttribute("sh", shortAuctionList);
		model.addAttribute("ve", liveAuctionList);
		return "index";
	}
}
