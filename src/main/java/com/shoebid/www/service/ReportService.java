package com.shoebid.www.service;

import java.util.List;

import com.shoebid.www.domain.MemberVO;
import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.ReportVO;

public interface ReportService {
	int register(ReportVO rpvo);
	List<ReportVO> getList(PagingVO pgvo);
	ReportVO getDetail(long rpno);
	int remove(long rpno);
	int getTotalCount();
}
