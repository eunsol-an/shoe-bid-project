package com.shoebid.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.ReviewVO;
import com.shoebid.www.repository.MemberDAO;
import com.shoebid.www.repository.ReviewDAO;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Inject
	private ReviewDAO rvdao;
	
	@Inject
	private MemberDAO mdao;

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public int register(ReviewVO rvvo) {
		int isUp = rvdao.insert(rvvo);
		if (isUp > 0) {
			isUp = mdao.updateGrade(rvvo.getSendMno(), 1);
		}
		return isUp;
	}

	@Override
	public List<ReviewVO> getList(long mno, PagingVO pgvo) {
		return rvdao.selectList(mno, pgvo);
	}

	@Override
	public int getTotalCount(long mno, PagingVO pgvo) {
		return rvdao.selectTotalCount(mno, pgvo);
	}
	
	@Override
	public ReviewVO getDetail(long rvno) {
		return rvdao.selectDetail(rvno);
	}

	@Override
	public int modify(ReviewVO rvvo) {
		int isUp = rvdao.update(rvvo);
		return isUp;
	}

}
