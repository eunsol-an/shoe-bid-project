package com.shoebid.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.ReviewVO;
import com.shoebid.www.repository.ReviewDAO;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Inject
	private ReviewDAO rvdao;

	@Override
	public int register(ReviewVO rvvo) {
		int isUp = rvdao.insert(rvvo);
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
