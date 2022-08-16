package com.shoebid.www.service;

import java.util.List;


import com.shoebid.www.domain.BidVO;
import com.shoebid.www.domain.PagingVO;

public interface BidService {
	int register(BidVO bvo); // 입찰하기
	List<BidVO> getList(long mno, PagingVO pgvo);
	int getTotalCount(long mno, PagingVO pgvo);
	String getBuyerNick(long pno);
}
