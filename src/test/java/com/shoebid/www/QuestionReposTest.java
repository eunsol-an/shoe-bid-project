package com.shoebid.www;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.QuestionVO;
import com.shoebid.www.repository.QuestionDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.shoebid.www.config.RootConfig.class})
public class QuestionReposTest {
	
	@Inject
	private QuestionDAO qdao;
	@Test
	public void insertQuestionTest() throws Exception{
		int isOk = qdao.insert(new QuestionVO(1L,"test",10L));
		log.info(">>>>>>>>insertTest ={}", isOk >0? "ok":"no");
	}
	@Test
	public void insertAnsQuestionTest() throws Exception{
		int isOk = qdao.insertAns(new QuestionVO(1L,2L,"test",10L));
		log.info(">>>>>>>>insertTest ={}", isOk >0? "ok":"no");
	}
	
	@Test
	public void selectTest() throws Exception{
		List<QuestionVO>  list= qdao.selectList(2,new PagingVO());
		for (QuestionVO qvo : list) {
			
			log.info(">>>>>>>>insertTest ={}", qvo);
			
		}
	}
	@Test
	public void selectAnsTest() throws Exception{
		QuestionVO qvo=  qdao.selectAns(4L);
		log.info(">>>>>>>>insertTest ={}", qvo);

	}
	
	@Test
	public void selectCountTest() throws Exception{
		int count =qdao.selectTotalCount(1);
	}
	
	

}
