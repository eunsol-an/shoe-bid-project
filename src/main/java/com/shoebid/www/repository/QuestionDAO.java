package com.shoebid.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.QuestionVO;
 

public interface QuestionDAO {
	int insert(QuestionVO qvo);
	int insertAns(QuestionVO qvo);
	List<QuestionVO> selectList(@Param("pno") long pno, @Param("pgvo") PagingVO pgvo);
	int update(QuestionVO qvo);
	QuestionVO selectAns(long qno);
	int selectTotalCount(long pno);
	int updateIsAnswer(long parent);
	int updateIsDeleted(long qno);	
}
