package com.sunflower.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sunflower.domain.CommentVO;

@Mapper
public interface CommentMapper {

	void commentRegister(CommentVO vo); //댓글등록
	List<CommentVO> getCommentList(int com_bno); //목록
	int getTotal(int com_bno); //댓글 개수
	CommentVO readComment(int com_no); //조회
	int updateComment(CommentVO vo); //수정
	int removeComment(int com_no); //삭제
}
