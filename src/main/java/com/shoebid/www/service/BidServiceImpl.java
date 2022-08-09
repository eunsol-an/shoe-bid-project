package com.shoebid.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shoebid.www.domain.BidVO;
import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.handler.PagingHandler;
import com.shoebid.www.repository.BidDAO;

@Service
public class BidServiceImpl implements BidService {
	
	@Inject
	private BidDAO bdao;

	@Override
	public int register(BidVO bvo) {
		int isUp = bdao.insert(bvo);
		return isUp;
	}

	@Override
	public List<BidVO> getList(long mno, PagingVO pgvo) {
		return bdao.selectList(mno, pgvo);
	}

	@Override
	public int getTotalCount(long mno, PagingVO pgvo) {
		return bdao.selectTotalCount(mno, pgvo);
	}

}
