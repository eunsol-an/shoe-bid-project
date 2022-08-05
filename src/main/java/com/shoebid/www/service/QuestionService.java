package com.shoebid.www.service;

import com.shoebid.www.domain.QuestionVO;
import com.shoebid.www.handler.PagingHandler;


import com.shoebid.www.domain.PagingVO;

public interface QuestionService {
	int post(QuestionVO cvo);
	PagingHandler spread(long pno, PagingVO pgvo);
	int modify(QuestionVO cvo);
	int remove(long cno);
	
}
