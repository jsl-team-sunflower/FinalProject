/*
package com.sunflower.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sunflower.domain.CommentVO;
import com.sunflower.service.CommentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController
@RequiredArgsConstructor
@RequestMapping("/comment")
@Log4j2
public class CommentController {

	private final CommentService commentService;
	
	@PostMapping("/insert")
	public String commentInsert(@RequestBody CommentVO vo, Principal principal) {
		vo.setCom_writer(principal.getName());
		commentService.commentRegister(vo);
		return "InsertSuccess";
	}
	
	@GetMapping("/list/{com_bno}")
	public @ResponseBody Map<String, Object> getList(@PathVariable int com_bno, Model model) {
		List<CommentVO> list = commentService.getCommentList(com_bno);
		int total = commentService.getTotal(com_bno);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("total", total);
		
		return map;
	}
	
	//locahost:8066/comment/1
	@DeleteMapping("/{com_no}")
	public ResponseEntity<String> getComment(@PathVariable int com_no) {
		return commentService.removeComment(com_no) == 1 ? 
				new ResponseEntity<>("ok",HttpStatus.OK) : 
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping("/read/{com_bno}")
	public @ResponseBody CommentVO getReadComment(@PathVariable int com_bno, Model model) {
		CommentVO list = commentService.readComment(com_bno);
		return list;
	}
	
	//@PutMapping("/update")
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH}, value="/update")
	public ResponseEntity<String> modify(@RequestBody CommentVO vo) { //com_no, content
		return commentService.updateComment(vo) == 1 ? 
				new ResponseEntity<>("ok",HttpStatus.OK) : 
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
*/




