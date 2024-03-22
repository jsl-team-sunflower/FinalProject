package com.sunflower.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QaVO {
	
	private int qnaNum;
	private String qnaTitle;
	private String qnaContent;
	private int qnaViewcount;
	private String qnaWriter;
	private Date qnaRegdate;
	private String id;
	private int qnaState;
	
	private AnVO avo; 
}
