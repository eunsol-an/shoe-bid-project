package com.shoebid.www;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.ReviewVO;
import com.shoebid.www.repository.ReviewDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.shoebid.www.config.RootConfig.class})
public class ReviewRepostTest {
	
	@Inject
	private ReviewDAO rdao;
	
	@Test
	public void updateReviewTest() throws Exception {
		int isUp = rdao.update(new ReviewVO(1, "리뷰수정테스트", 1));
		log.info(">>> updateReviewTest : {} ", isUp > 0 ? "OK" : "FAIL");
	}
	
	
	@Test
	public void selectTotalCountTest() throws Exception {
		PagingVO pgvo = new PagingVO();
		pgvo.setType("s");
		int count = rdao.selectTotalCount(1, pgvo);
		log.info(">>> {}", count);
	}
	
	
	@Test
	public void selectReviewListTest() throws Exception {
		PagingVO pgvo = new PagingVO();
		pgvo.setType("s");
		List<ReviewVO> list = rdao.selectList(1, pgvo);
		for (ReviewVO rvvo : list) {
			log.info(">>> {}", rvvo);
		}
	}
	
	@Test
	public void intsertReviewTest() throws Exception {
		int isUp = rdao.insert(new ReviewVO(10, 1, 4, "리뷰테스트", 5));
		log.info(">>> insertReviewTest : {} ", isUp > 0 ? "OK" : "FAIL");
	}
}
