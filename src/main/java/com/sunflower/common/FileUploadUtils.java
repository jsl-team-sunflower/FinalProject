package com.sunflower.common;

import java.io.File;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sunflower.domain.AttachVO;

@Component
public class FileUploadUtils {
	
	private final String uploadFolder = Paths.get("D:", "upload").toString();
	
	//년월일 폴더 생성을 위한 날짜 생성
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}//getFolder()
	
	public List<AttachVO> uploadFiles(@RequestParam("uploadfile") MultipartFile[] uploadFile) {
	//년월일 폴더 생성
		String uploadPathDate = getFolder();
		File uploadPath = new File(uploadFolder, uploadPathDate);
		
		if(uploadPath.exists()==false) {
			uploadPath.mkdirs();
		}
		
		List<AttachVO> list = new ArrayList<>();
		
		//파일 전송
		for(MultipartFile file : uploadFile) {
			AttachVO vo = new AttachVO();
			
			//원래 파일이름
			String uploadOriginalFileName= file.getOriginalFilename();
			//IE 원래 파일이름
			uploadOriginalFileName = uploadOriginalFileName.substring(uploadOriginalFileName.lastIndexOf("\\")+1);
			
			UUID uuid = UUID.randomUUID(); //중복 방지를 위한 UUID 생성
			String uploadFileName = uuid.toString()+"_"+uploadOriginalFileName;
			
			File saveFile = new File(uploadPath, uploadFileName);// 전송하기 위한 폴더와 파일
			
			try {
				file.transferTo(saveFile);
				vo.setUuid(uuid.toString());
				vo.setUploadPath(uploadPathDate);
				vo.setUploadFile(uploadOriginalFileName);
				vo.setFiletype(true);
			} catch (Exception e) {
				e.printStackTrace();
			}
			list.add(vo);
		}//for문
		return list;
	}//uploadFiles()
	
}//
