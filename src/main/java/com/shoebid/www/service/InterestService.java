package com.shoebid.www.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shoebid.www.domain.InterestVO;
import com.shoebid.www.domain.PagingVO;

public interface InterestService {
	int register(InterestVO itvo);
	List<InterestVO> getList(long mno, PagingVO pgvo);
	int remove(InterestVO itvo);
	int getTotalCount(long mno);
	int getItCheck(@Param("pno") long pno, @Param("mno") long mno);
}
