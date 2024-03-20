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

import com.sunflower.domain.AnVO;
import com.sunflower.domain.QaVO;
import com.sunflower.service.QaService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/qa")
@RequiredArgsConstructor
public class QaController {
	
	
private final QaService qaService;
	
	//localhost:8066/qa/list
	@GetMapping("/list")
	public String qaList(Model model) {
		List<QaVO> list = qaService.getList();
		model.addAttribute("list",list);
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
	
	@GetMapping("/view")
	public String qaVo(@RequestParam("qnaNum") int bno, Model model) {
		QaVO vo = qaService.getVo(bno);
		model.addAttribute("vo",vo);
		return "/qna/view";
	}
	
	@PostMapping("/answer")
    @ResponseBody
	public Map<String, Object> getAnswer(@RequestBody AnVO vo) {
		Map<String, Object> result = new HashMap<>();
		int re = qaService.anRegister(vo); 
		result.put("key", re);
		return result;	 
	}
	
	@GetMapping("/delete") 
	public String deleteQuestion(@RequestParam("qnaNum") int qnaNum, Model model) { 
		qaService.deleteQuestion(qnaNum); 
		return "redirect:/qa/list"; 
	}
}

