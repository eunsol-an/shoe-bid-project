package com.shoebid.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shoebid.www.domain.MemberVO;
import com.shoebid.www.repository.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO mdao;

	@Override
	public int register(MemberVO mvo) {
		return mdao.insert(mvo);
	}

	@Override
	public MemberVO login(MemberVO mvo) {
		return mdao.selectOne(mvo);
	}

	@Override
	public List<MemberVO> getList() {
		return mdao.selectList();
	}

	@Override
	public MemberVO getDetail(long mno) {
		return mdao.selectDetail(mno);
	}

	@Override
	public int modify(MemberVO mvo) {
		return mdao.update(mvo);
	}

	@Override
	public int remove(long mno) {
		return mdao.delete(mno);
	}
	
	
}
