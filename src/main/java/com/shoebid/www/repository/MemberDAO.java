package com.shoebid.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shoebid.www.domain.MemberVO;
import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.ReportVO;


public interface MemberDAO {
	int insert(MemberVO mvo); // register
	MemberVO selectOne(MemberVO mvo); // login
	List<MemberVO> selectList(PagingVO pgvo); //list
	MemberVO selectDetail(long mno); // detail
	int update(MemberVO mvo); // modify
	int delete(MemberVO mvo); // remove
	int selectTotalCount();
	int selectId(String id); // 아이디 중복검사
	int selectNickName(String nickName); // 닉네임 중복검사
	int selectEmail(String email); // 이메일 중복검사
	long selectLastMno();
	long selectReportCount();
	int updateReportCount(ReportVO rpvo);
	List<MemberVO> findId(String email);
	MemberVO searchPwd(MemberVO mvo);
	int modifyPwd(@Param("id") String id, @Param("email") String email, @Param("pwd") String pwd);
	String chooseNickName(long mno);
	int updateGrade(@Param("mno") long mno, @Param("i") int i);
}
