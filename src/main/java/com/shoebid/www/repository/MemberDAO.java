package com.shoebid.www.repository;

import java.util.List;

import com.shoebid.www.domain.MemberDTO;
import com.shoebid.www.domain.MemberVO;
import com.shoebid.www.domain.PagingVO;


public interface MemberDAO {
	int insert(MemberVO mvo); // register
	MemberVO selectOne(MemberVO mvo); // login
	List<MemberVO> selectList(PagingVO pgvo); //list
	MemberVO selectDetail(long mno); // detail
	int update(MemberVO mvo); // modify
	int delete(MemberVO mvo); // remove
	int selectTotalCount();
	int selectId(String id); // 아이디 중복검사
	int selectNickName(String nickName);
	long selectLastMno();
	long selectReportCount();
}
