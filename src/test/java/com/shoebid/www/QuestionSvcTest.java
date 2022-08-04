package com.shoebid.www;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.shoebid.www.domain.QuestionVO;
import com.shoebid.www.service.QuestionService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { com.shoebid.www.config.RootConfig.class })
public class QuestionSvcTest {
	
	@Inject
	private QuestionService qsv;
	
	@Test
	public void insertQuestionDummiesTest() throws Exception {
		for (int j = 1; j <= 256; j++) {
			int x = (int) (Math.random() * 256);
			for (int i = 0; i < x; i++) {
				qsv.post(new QuestionVO(j, ((int) (Math.random() * 256)), "Question Dummy Content for" + j));
			}
		}
	}

}
