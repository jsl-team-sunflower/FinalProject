package com.sunflower.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CommentVO {

	 private int com_no;
	 private String com_writer;
	 private String com_content;
	 
	 @JsonFormat(pattern = "yyyy-MM-dd")
	 private Date com_regdate;
	 private int com_bno;
	    
}
