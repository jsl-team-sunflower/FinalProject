package com.sunflower.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sunflower.common.Criteria;
import com.sunflower.domain.AnVO;
import com.sunflower.domain.QaVO;

@Mapper
public interface QaMapper {

	public void register(QaVO vo);

	public List<QaVO> list();
	
	public List<QaVO> getListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
			
	public QaVO getVo(int bno);
	public QaVO nextRecord(int qnaNum);
	public QaVO prevRecord(int qnaNum);

	public void anRegister(AnVO vo);

	public int setUpdate(int qbno);

	public void deleteQuestion(int qnaNum);
	public AnVO getSelect(int qbno);
	
	
}
