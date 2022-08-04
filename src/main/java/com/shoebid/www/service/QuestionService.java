package com.shoebid.www.service;

import com.shoebid.www.domain.QuestionVO;
import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.handler.PagingHandler;

public interface QuestionService {
	int post(QuestionVO qvo);
	PagingHandler spread(long pno, PagingVO pgvo);
	int modify(QuestionVO qvo);
	int remove(long qno);
}
