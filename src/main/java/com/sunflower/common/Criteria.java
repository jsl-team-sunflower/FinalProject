package com.sunflower.common;

import lombok.Data;

@Data
public class Criteria {

	private int pageNum; //페이지번호
	private int amount; //한페지에 출력하는 레코드 수
	private String type; //검색 타입
	private String keyword; //검색 단어
	
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
}
