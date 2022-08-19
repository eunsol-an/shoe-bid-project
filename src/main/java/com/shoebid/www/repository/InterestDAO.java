package com.shoebid.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shoebid.www.domain.InterestVO;
import com.shoebid.www.domain.PagingVO;

public interface InterestDAO {
	int insert(InterestVO itvo);
	List<InterestVO> selectList(@Param("mno") long mno, @Param("pgvo") PagingVO pgvo);
	int delete(InterestVO itvo);
	int remove(InterestVO itvo);
	int selectTotalCount(long mno);
	int itCheck(@Param("pno") long pno, @Param("mno") long mno);
	int selectItQty(long pno);
}
