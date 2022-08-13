package com.shoebid.www;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.shoebid.www.domain.InterestVO;
import com.shoebid.www.repository.InterestDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration (classes = {com.shoebid.www.config.RootConfig.class})
public class InterestReposTest {
	
	@Inject
	private InterestDAO idao;

	@Test
	public void insertInterestDummy() throws Exception {
		int isUp = idao.insert(new InterestVO(4, 8));
	}
}
