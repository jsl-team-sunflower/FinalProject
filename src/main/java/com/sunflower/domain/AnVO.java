package com.sunflower.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AnVO {
	
	private int comNum;
	private String comContent;
	private int qnaNum;
	private String comWriter;
	private Date comRegdate;
}
