package com.shoebid.www.repository;

import java.util.List;

import com.shoebid.www.domain.MemberVO;


public interface MemberDAO {
	int insert(MemberVO mvo); // register
	MemberVO selectOne(MemberVO mvo); // login
	List<MemberVO> selectList(); //list
	MemberVO selectDetail(long mno); // detail
	int update(MemberVO mvo); // modify
	int delete(long mno); // remove
}
