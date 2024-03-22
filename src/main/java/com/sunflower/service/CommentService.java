package com.sunflower.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sunflower.domain.CommentVO;
import com.sunflower.mapper.CommentMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommentService {

	private final CommentMapper commentMapper;
	
	public void commentRegister(CommentVO vo) {
		commentMapper.commentRegister(vo);
	}
	public List<CommentVO> getCommentList(int com_bno) {
		System.out.println(">>>>service"+com_bno);
		return commentMapper.getCommentList(com_bno);
	}
	public int getTotal(int com_bno) {
		return commentMapper.getTotal(com_bno);
	}
	public CommentVO readComment(int com_no) {
		return commentMapper.readComment(com_no);
	}
	public int updateComment(CommentVO vo) {
		return commentMapper.updateComment(vo);
	}
	public int removeComment(int com_no) {
		return commentMapper.removeComment(com_no);
	}
	
}
