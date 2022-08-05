package com.shoebid.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shoebid.www.domain.AnswerVO;
import com.shoebid.www.repository.AnswerDAO;

@Service
public class AnswerServiceImpl implements AnswerService {
	
	@Inject
	private AnswerDAO adao;

	@Override
	public int post(AnswerVO avo) {
		return adao.insert(avo);
	}

	@Override
	public List<AnswerVO> spread(long qno) {
		return adao.selectList(qno);
	}
	
	@Override
	public int modify(AnswerVO avo) {
		return adao.update(avo);
	}

	@Override
	public int remove(long ano) {
		return adao.delete(ano);
	}

}