package com.shoebid.www;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.shoebid.www.domain.MemberVO;
import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.shoebid.www.config.RootConfig.class})
@Slf4j
public class MemberSvcTest {
	
	@Inject
	private MemberService msv;
	
	@Test
	public void removeMemberTest() throws Exception {
		int isUp = msv.remove(new MemberVO(7, "2022-08-06 : 03:15:24"));
		log.info(">>> Test of remove Member : {} ", isUp > 0 ? "OK":"FAIL");
	}
	
	@Test
	public void LoginMemberTest() throws Exception {
		MemberVO mvo = msv.login(new MemberVO("testsvc", "1111"));
		log.info(">>>  {}, {}, {}, {}, {}",
				mvo.getMno(), mvo.getId(), mvo.getPwd(), mvo.getNickName(), mvo.getRegAt());
	}
	
	@Test
	public void getListMemberListTest() throws Exception {
		PagingVO pgvo;
		List<MemberVO> list = msv.getList(new PagingVO());
		for (MemberVO mvo : list) {
			log.info(">>> {},{},{},{},{},{}",
					mvo.getMno(), mvo.getId(), mvo.getEmail(), mvo.getNickName(), 
					mvo.getNickName(), mvo.getGrade(), mvo.getMemberImg());
		}
	}
	
}
