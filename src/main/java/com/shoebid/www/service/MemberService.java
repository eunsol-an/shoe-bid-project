package com.shoebid.www.service;

import java.util.List;

import com.shoebid.www.domain.MemberVO;
import com.shoebid.www.domain.PagingVO;

public interface MemberService {
	int register(MemberVO mvo);
	MemberVO login(MemberVO mvo);
	List<MemberVO> getList(PagingVO pgvo);
	MemberVO getDetail(long mno);
	int modify(MemberVO mvo);
	int remove(long mno);
	int getTotalCount();
}
