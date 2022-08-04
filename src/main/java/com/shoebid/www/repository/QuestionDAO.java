package com.shoebid.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.QuestionVO;

public interface QuestionDAO {
	int insert(QuestionVO qvo);
	List<QuestionVO> selectList(@Param("pno") long pno, @Param("pgvo") PagingVO pgvo);
	int update(QuestionVO qvo);
	int delete(long qno);
	int selectTotalCount(long pno);

}
