package com.sunflower.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunflower.common.Criteria;
import com.sunflower.common.PageDTO;
import com.sunflower.domain.AnVO;
import com.sunflower.domain.QaVO;
import com.sunflower.service.QaService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/qa")
@RequiredArgsConstructor
public class QaController {
	
	
private final QaService qaService;
// private final FileUploadUtils fileUploadUtils; 
	
	//localhost:8066/qa/list
	@GetMapping("/list")
	public String qaList(Criteria cri, Model model) {
		List<QaVO> list = qaService.getList(cri); // 여기에 cri 넣으면 안됩유 ㅠㅠ
		
		int total = qaService.getTotalCount(cri);
		System.out.print(total);
		model.addAttribute("list",list);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "/qna/qa";
	}
	
	//localhost:8066/qa/write
	@GetMapping("/write")
	public String qaWrite() {
		return "/qna/write";
	}
	
	@PostMapping("write")
	public String qaWritePost(QaVO vo) {
		qaService.register(vo);
		return "redirect:/qa/list";
	}
	
	// board에선 /get
	@GetMapping("/view")
	public String qaVo(@RequestParam("qnaNum") int bno, Model model) {
		QaVO vo = qaService.getVo(bno);
		model.addAttribute("vo",vo);
		model.addAttribute("nextRecord",qaService.nextRecord(bno));
		model.addAttribute("prevRecord",qaService.prevRecord(bno));
		return "/qna/view";
	}
	
	@PostMapping("/answer")
    @ResponseBody
	public Map<String, Object> getAnswer(@RequestBody AnVO vo) {
		Map<String, Object> result = new HashMap<>();
		int re = qaService.anRegister(vo); // 질문의 Vo를 불러와서 
		result.put("key", re);
		return result;	 
	}
	
	@GetMapping("/delete") 
	public String deleteQuestion(@RequestParam("qnaNum") int qnaNum, Model model) { 
		qaService.deleteQuestion(qnaNum); 
		return "redirect:/qa/list"; 
	}
	
	@GetMapping("/contact")
	public String chat() {
		return "/qna/contactUs";
	}
	
	@PostMapping("/MailSentSuccessfully")
	public String MailSentSuccessfully() {
		return "/qna/Mail-Sent-Successfully";
	}
	
	@GetMapping("/delivery")
	public String delivery(Model model) {
		model.addAttribute("ds",3);
		return "/my/delivery";
	}
	
	@GetMapping("/aboutus")
	public String aboutus() {
		return "/qna/aboutUs";
	}
}

