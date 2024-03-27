package com.sunflower.domain;

import lombok.Data;

@Data
public class AttachVO {
	
	private String uuid;
	private int productNum;
	private String uploadPath;
	private String uploadFile;
	private boolean filetype;
	
	
}
