package com.shoebid.www.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.ReviewVO;

public interface ReviewService {
	int register(ReviewVO rvvo);
	List<ReviewVO> getList(long mno, PagingVO pgvo);
	int getTotalCount(long mno, PagingVO pgvo);
	ReviewVO getDetail(long rvno);
	int modify(ReviewVO rvvo);
}
