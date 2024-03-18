package com.sunflower.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/auction")
@Log4j2
public class AuctionController {
	
	@GetMapping("/main")
	public String main() { 
		return "index";
	}
	
	@GetMapping("/onauction")
	public String onAuction() { 
		return "/Auction/onGoingAuction";
	}
	
	@GetMapping("/ScheduleAuction")
	public String ScheduleAuction() { 
		return "/Auction/ScheduleAuction";
	}
	
	@GetMapping("/ResultAuction")
	public String ResultAuction() { 
		return "/Auction/ResultAuction";
	}
	
}