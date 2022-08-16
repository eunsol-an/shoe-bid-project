package com.shoebid.www.service;

import com.shoebid.www.domain.QuestionVO;
import com.shoebid.www.handler.PagingHandler;

import java.util.List;

import com.shoebid.www.domain.PagingVO;

public interface QuestionService {
	int post(QuestionVO qvo);
	PagingHandler spread(long pno, PagingVO pgvo);
	int modify(QuestionVO qvo);
	QuestionVO getSelectAns(long parent);
	int modifyIsDeleted(long qno);
}
