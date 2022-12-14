package com.shoebid.www.service;

import java.util.List;

import com.shoebid.www.domain.MemberDTO;
import com.shoebid.www.domain.MemberVO;
import com.shoebid.www.domain.PagingVO;

public interface MemberService {
	int register(MemberDTO mdto);
	MemberVO login(MemberVO mvo);
	List<MemberVO> getList(PagingVO pgvo);
	MemberDTO getDetail(long mno);
	int modify(MemberDTO mdto);
	int remove(MemberVO mvo);
	int getTotalCount();
	int idDupleCheck(String id);
	int nickNameDupleCheck(String nickName);
	int emailDupleCheck(String email);
	int removeFile(String uuid);
	List<MemberVO> findId(String email);
	MemberVO searchPwd(MemberVO mvo);
	int modifyPwd(String id, String email, String pwd);
	int modifyPwd(MemberVO mvo);
	String chooseNickName(long mno);
	
}
