package com.shoebid.www.service; 

import java.util.List;

import com.shoebid.www.domain.AnswerVO;

public interface AnswerService {
	int post(AnswerVO avo);
	List<AnswerVO> spread(long qno);
	int modify(AnswerVO avo);
	int remove(long ano);
}
