package com.shoebid.www;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.shoebid.www.domain.BidVO;
import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.repository.BidDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.shoebid.www.config.RootConfig.class})
public class BidReposTest {

	@Inject
	private BidDAO bdao;
	
	@Test
	public void insertDummyTest() throws Exception {
		for (int i = 0; i < 200; i++) {
			bdao.insert(new BidVO(1, 2, (int)(Math.random()*300001)+300000, (int)(Math.random()*2)));
		}
	}
	
	@Test
	public void insertBidTest() throws Exception {
		int isOk = bdao.insert(new BidVO(2, 1, 20000, 0));
		log.info(">>> insertBidTest : {} ", isOk > 0 ? "OK" : "FAIL");
	}
	
	@Test
	public void selectBidListTest() throws Exception {
		List<BidVO> list = bdao.selectList(2, new PagingVO());
		for (BidVO bvo : list) {
			log.info(">>> {}", bvo);
		}
	}
}
