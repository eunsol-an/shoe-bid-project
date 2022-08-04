package com.shoebid.www.repository;

import java.util.List;

import com.shoebid.www.domain.ReportVO;

public interface ReportDAO {

	int insert(ReportVO rpvo);
	List<ReportVO> selectList();
	ReportVO selectOne(long rpno);
	ReportVO selectDetail(long rpno);
	int delete(long rpno);

}
