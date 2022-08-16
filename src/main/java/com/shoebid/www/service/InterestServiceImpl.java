package com.shoebid.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shoebid.www.domain.InterestVO;
import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.repository.InterestDAO;
import com.shoebid.www.repository.ProductDAO;

@Service
public class InterestServiceImpl implements InterestService {
	@Inject
	private InterestDAO itdao;
	
	@Inject 
	private ProductDAO pdao;

	@Override
	public int register(InterestVO itvo) {
		pdao.updateReadCount(itvo.getPno(),-1);
		
		return itdao.insert(itvo);
	}

	@Override
	public List<InterestVO> getList(long mno, PagingVO pgvo) {
		return itdao.selectList(mno, pgvo);
	}

	@Override
	public int remove(InterestVO itvo) {
		if(itvo.isReadCk()) {
			pdao.updateReadCount(itvo.getPno(),-1);
		}
		return itdao.delete(itvo);
	}

	@Override
	public int getTotalCount(long mno) {
		return itdao.selectTotalCount(mno);
	}

	@Override
	public int getItCheck(long pno, long mno) {
		return itdao.itCheck(pno, mno);
	}

}
