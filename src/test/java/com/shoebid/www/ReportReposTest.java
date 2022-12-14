package com.shoebid.www;
import java.util.List;



import javax.inject.Inject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.ReportVO;
import com.shoebid.www.repository.ReportDAO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration (classes = {com.shoebid.www.config.RootConfig.class})
public class ReportReposTest {
	private static Logger log = LoggerFactory.getLogger(ReportReposTest.class);
	
	@Inject
	private ReportDAO rpdao;
	
	@Test
	public void insertReportDummy() throws Exception {
		
		int isUp = rpdao.insert(new ReportVO(3, 4,"testTitle2","testContent2"));
		log.info(">>> Test of register Reportr : {} ", isUp > 0 ? "OK":"FAIL");
	}
	
	@Test
	public void deleteReportTest() throws Exception {
		int isUp = rpdao.delete(1L);
		log.info(">>> Test of delete Report : {} ", isUp > 0 ? "OK":"FAIL");
	}
	
	@Test
	public void insertReportDummies() throws Exception {
		for (int i = 4; i < 101; i++) {
			rpdao.insert(new ReportVO(i, i+4,"testTitle"+i,"testContent"+i));
		}
	}
}