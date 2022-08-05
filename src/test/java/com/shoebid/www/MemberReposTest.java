package com.shoebid.www;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.shoebid.www.domain.MemberVO;
import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.repository.MemberDAO;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.shoebid.www.config.RootConfig.class})
@Slf4j
public class MemberReposTest {
	
	@Inject
	private MemberDAO mdao;
	
	@Test
	public void deleteMemberTest() throws Exception {
		int isUp = mdao.delete(6);
		log.info(">>> Test of delete Member : {} ", isUp > 0 ? "OK":"FAIL");
	}
	
	@Test
	public void updateMemberTest() throws Exception {
		int isUp = mdao.update(new MemberVO(6, "test1", "4444", "testup", 10, 10, "asdf"));
		log.info(">>> Test of update Member : {} ", isUp > 0 ? "OK":"FAIL");
	}
	
	@Test
	public void getDetailMemberTest() throws Exception {
		MemberVO mvo = mdao.selectDetail(6);
	}
	
	@Test
	public void getListMemberListTest() throws Exception {
		PagingVO pgvo;
		List<MemberVO> list = mdao.selectList(new PagingVO());
		for (MemberVO mvo : list) {
			log.info(">>> {}, {}, {}, {}, {}, {}",
					mvo.getMno(), mvo.getId(), mvo.getEmail(), mvo.getNickName(), mvo.getGrade(), mvo.getMemberImg());
		}
	}
	
	@Test
	public void LoginMemberTest() throws Exception {
		MemberVO mvo = mdao.selectOne(new MemberVO("test2", "1111"));
		log.info(">>>  {}, {}, {}, {}, {}",
				mvo.getMno(), mvo.getId(), mvo.getPwd(), mvo.getNickName(), mvo.getRegAt());
	}
	
	@Test
	public void insertMemberDummies() throws Exception {
		for (int i = 1; i < 101; i++) {
			mdao.insert(new MemberVO("test"+i, "test"+i+"test.com", "1111", "nick"+i, null));
		}
	}
	
	@Test
	public void insertMemberDummy() throws Exception {
		int isUp = mdao.insert(new MemberVO("test1", "test1@test.com", "1234", "test1", "qwer"));
		log.info(">>> Test of insert Member : {} ", isUp > 0 ? "OK":"FAIL");
	}
}
