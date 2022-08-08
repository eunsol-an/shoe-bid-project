package com.shoebid.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.ReportVO;
import com.shoebid.www.repository.ReportDAO;

@Service
public class ReportServiceImpl implements ReportService {

	@Inject
	private ReportDAO rpdao;
	
	@Override
	public int register(ReportVO rpvo) {
		return rpdao.insert(rpvo);
	}

	@Override
	public List<ReportVO> getList(PagingVO pgvo) {
		return rpdao.selectList(pgvo);
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
	public int getTotalCount() {
		return rpdao.selectTotalCount();
	}

	
	
}