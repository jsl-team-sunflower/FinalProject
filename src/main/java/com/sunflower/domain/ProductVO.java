package com.sunflower.domain;



import java.time.LocalDateTime;
import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
	private int productNum;
	private String productName;
	private String productWriter;
	private String startPrice;
	private String presentPrice;
	private String endPrice;
	private Date startTime;
	private LocalDateTime endTime;
	private int productViewcount;
	private int productTenderCount;
}
