package com.sunflower.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {

	private int productNum;
	private int orderNum;
	private int orderState;
	private String orderName;
	private String orderPhone;
	private String orderAddress;
	private Date orderDate;
	private String delNum;
	
	
}
