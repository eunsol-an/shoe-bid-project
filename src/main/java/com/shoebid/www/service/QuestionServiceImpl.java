 package com.shoebid.www.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.QuestionVO;
import com.shoebid.www.handler.PagingHandler;
import com.shoebid.www.repository.QuestionDAO;

@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Inject
	private QuestionDAO qdao;

	@Override
	public int post(QuestionVO qvo) {
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
	public int remove(long cno) {
		return qdao.delete(cno);
	}
}