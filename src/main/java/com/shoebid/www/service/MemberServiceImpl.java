package com.shoebid.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.shoebid.www.domain.ImageFileVO;
import com.shoebid.www.domain.MemberDTO;
import com.shoebid.www.domain.MemberVO;
import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.repository.ImageFileDAO;
import com.shoebid.www.repository.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO mdao;
	
	@Inject
	private ImageFileDAO idao;

	@Transactional
	@Override
	public int register(MemberDTO mdto) {
		int isUp = mdao.insert(mdto.getMvo());
		for (ImageFileVO ivo : mdto.getImageList()) {
			long mno = mdao.selectLastMno();
			ivo.setMno(mno);
			isUp *= idao.insertMImage(ivo);
		}
		return isUp;
	}

	@Override
	public MemberVO login(MemberVO mvo) {
		return mdao.selectOne(mvo);
	}

	@Override
	public List<MemberVO> getList(PagingVO pgvo) {
		return mdao.selectList(pgvo);
	}
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public MemberDTO getDetail(long mno) {
		List<ImageFileVO> imageList = idao.selectListMImage(mno);
		return new MemberDTO(mdao.selectDetail(mno), imageList);
	}

	@Transactional
	@Override
	public int modify(MemberDTO mdto) {
		int isUp = mdao.update(mdto.getMvo());
			if(mdto.getImageList() != null) {
				isUp = idao.deleteAllMImage(mdto.getMvo().getMno());
				for (ImageFileVO ivo :mdto.getImageList() ) {
					ivo.setMno(mdto.getMvo().getMno());
					isUp *= idao.insertMImage(ivo);
			}
		}
		return isUp;
	}

	@Override
	public int remove(MemberVO mvo) {
		return mdao.delete(mvo);
	}

	@Override
	public int getTotalCount() {
		return mdao.selectTotalCount();
	}

	@Override
	public int idDupleCheck(String id) {
		return mdao.selectId(id);
	}

	@Override
	public int nickNameDupleCheck(String nickName) {
		return mdao.selectNickName(nickName);
	}

	@Override
	public int removeFile(String uuid) {
		return idao.deleteImage(uuid);
	}

	@Override
	public List<MemberVO> findId(String email) {
		return mdao.findId(email);
	}
	
	
}
