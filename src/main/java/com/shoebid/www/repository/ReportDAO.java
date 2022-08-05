package com.shoebid.www.repository;

import java.util.List;


import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.ReportVO;

public interface ReportDAO {

	int insert(ReportVO rpvo);
	List<ReportVO> selectList(PagingVO pgvo);
	ReportVO selectOne(long rpno);
	int delete(long rpno);
	int selectTotalCount();
}
