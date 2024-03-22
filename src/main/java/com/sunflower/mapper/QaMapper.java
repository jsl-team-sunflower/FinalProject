package com.sunflower.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sunflower.domain.AnVO;
import com.sunflower.domain.QaVO;

@Mapper
public interface QaMapper {

	public void register(QaVO vo);

	public List<QaVO> list();

	public QaVO getVo(int bno);
	public QaVO nextRecord(int qnaNum);
	public QaVO prevRecord(int qnaNum);

	public void anRegister(AnVO vo);

	public AnVO getSelect(int qbno);

	public int setUpdate(int qbno);

	public void deleteQuestion(int qnaNum);
	
}
