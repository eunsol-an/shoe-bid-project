package com.shoebid.www.service;

import java.util.List;

import com.shoebid.www.domain.ReportVO;

public interface ReportService {
	int register(ReportVO rpvo);
	List<ReportVO> getList();
	ReportVO getDetail(long rpno);
	int remove(long rpno);
}
