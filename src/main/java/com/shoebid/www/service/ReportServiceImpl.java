package com.shoebid.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shoebid.www.domain.MemberVO;
import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.ReportVO;
import com.shoebid.www.repository.MemberDAO;
import com.shoebid.www.repository.ReportDAO;

@Service
public class ReportServiceImpl implements ReportService {

	@Inject
	private ReportDAO rpdao;
	@Inject
	private MemberDAO mdao;
	
	@Override
	public int register(ReportVO rpvo) {
		int isUp = mdao.updateReportCount(rpvo);
		return rpdao.insert(rpvo);
	}

	@Override
	public List<ReportVO> getList(long mno, PagingVO pgvo) {
		return rpdao.selectList(mno, pgvo);
	}
	
	@Override
	public List<ReportVO> getAllList(long mno, PagingVO pgvo) {
		return rpdao.selectAllList(mno, pgvo);
	}
	
	@Override
	public ReportVO getDetail(long rpno) {
		return rpdao.selectOne(rpno);
	}

	@Override
	public int remove(long rpno) {
		return rpdao.delete(rpno);
	}

	@Override
	public int getTotalCount(long mno) {
		return rpdao.selectTotalCount(mno);
	}

	@Override
	public int getTotalAllCount(long mno) {
		return rpdao.selectAllTotalCount(mno);
	}


	
	
}
