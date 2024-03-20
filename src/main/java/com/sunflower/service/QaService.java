package com.sunflower.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sunflower.domain.AnVO;
import com.sunflower.domain.QaVO;
import com.sunflower.mapper.QaMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QaService {
	private final QaMapper qaMapper;

	public void register(QaVO vo) {
		qaMapper.register(vo);
	}

	public int anRegister(AnVO vo) {
		qaMapper.anRegister(vo); // 답변등록
		int result = qaMapper.setUpdate(vo.getQnaNum()); // 질문 상태 0 -> 1
		return result;
	}

	public List<QaVO> getList() {
		return qaMapper.list();
	}

	public QaVO getVo(int bno) {
		QaVO qvo = qaMapper.getVo(bno); // 질문글
		if (qvo.getQnaState() == 1) { // 답변글
			AnVO avo = qaMapper.getSelect(bno);
			qvo.setAvo(avo);
		}
		return qvo;
	}

	public void deleteQuestion(int qnaNum){ 
		qaMapper.deleteQuestion(qnaNum); 
	}
}
