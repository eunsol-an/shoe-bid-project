package com.shoebid.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.ReviewVO;

public interface ReviewDAO {
	int insert(ReviewVO rvvo);
	List<ReviewVO> selectList(@Param("mno") long mno, @Param("pgvo") PagingVO pgvo);
	int selectTotalCount(@Param("mno") long mno, @Param("pgvo") PagingVO pgvo);
	ReviewVO selectDetail(long rvno);
	int update(ReviewVO rvvo);
}
