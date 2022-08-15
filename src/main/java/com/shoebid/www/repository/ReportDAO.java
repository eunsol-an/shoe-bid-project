package com.shoebid.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.ReportVO;

public interface ReportDAO {

	int insert(ReportVO rpvo);
	List<ReportVO> selectList(@Param("mno") long mno, @Param("pgvo") PagingVO pgvo);
	List<ReportVO> selectAllList(@Param("mno") long mno, @Param("pgvo") PagingVO pgvo);
	ReportVO selectOne(long rpno);
	int delete(long rpno);
	int selectTotalCount(long mno);
	int selectAllTotalCount(long mno);
}
