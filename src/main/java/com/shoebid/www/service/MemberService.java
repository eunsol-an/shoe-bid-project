package com.shoebid.www.service;

import java.util.List;

import com.shoebid.www.domain.MemberVO;

public interface MemberService {
	int register(MemberVO mvo);
	MemberVO login(MemberVO mvo);
	List<MemberVO> getList();
	MemberVO getDetail(long mno);
	int modify(MemberVO mvo);
	int remove(long mno);
}
