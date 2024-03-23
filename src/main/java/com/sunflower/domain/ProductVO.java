package com.sunflower.domain;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ProductVO {
		
	private int productNum;//hm_product_seq
	private String productName;
	private String productWriter;
	private String startPrice;
	private LocalDateTime startTime; //default
	private int state; //default
	private int productViewcount; //default
	private int productTenderCount; //default
	private String tenderPrice; 
	
	private int tenderNum;
	
	private List<AttachVO> attach;
	
}
