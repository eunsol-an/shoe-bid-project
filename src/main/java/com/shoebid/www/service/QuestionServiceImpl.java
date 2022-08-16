 package com.shoebid.www.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.QuestionVO;
import com.shoebid.www.handler.PagingHandler;
import com.shoebid.www.repository.QuestionDAO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Inject
	private QuestionDAO qdao;

	@Override
	public int post(QuestionVO qvo) {
		log.info(">>>>>qvo.getIsAnswer() = {}",qvo.getParent());
		int isUp = 0;
		if(qvo.getParent()>0) {
			 isUp = qdao.updateIsAnswer(qvo.getParent());
			 return qdao.insertAns(qvo);
		}
		return qdao.insert(qvo);
	}
	
	
	@Override
	public PagingHandler spread(long pno, PagingVO pgvo) {
		return new PagingHandler(qdao.selectList(pno, pgvo),
				pgvo, qdao.selectTotalCount(pno));
	}

	@Override
	public int modify(QuestionVO qvo) {
		return qdao.update(qvo);
	}


	

	@Override
	public QuestionVO getSelectAns(long parent) {
		return qdao.selectAns(parent);
	}


	@Override
	public int modifyIsDeleted(long qno) {
		return qdao.updateIsDeleted(qno);
	}
}