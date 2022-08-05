package com.shoebid.www.repository;

import java.util.List;

import com.shoebid.www.domain.AnswerVO;

public interface AnswerDAO {
	int insert(AnswerVO avo);
	List<AnswerVO> selectList(long qno);
	int update(AnswerVO avo);
	int delete(long ano);
	int selectTotalCount(long qno);

}
