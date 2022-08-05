package com.shoebid.www;

import java.util.List;


import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.ReportVO;
import com.shoebid.www.service.ReportService;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.shoebid.www.config.RootConfig.class})
@Slf4j
public class ReportSvcTest {

	@Inject
	private ReportService rpsv;
	
	@Test
	public void insertReportDummy() throws Exception {
		int isUp = rpsv.register(new ReportVO(4, 5,"testTitle3","testContent4"));
		log.info(">>> Test of register Report : {} ", isUp > 0 ? "OK":"FAIL");
	}
	@Test
	public void getListReportListTest() throws Exception {
		List<ReportVO> list  = rpsv.getList(new PagingVO());
		for (ReportVO rpvo : list) {
			log.info(">>> {},{},{},{},{}",
					rpvo.getRpno(), rpvo.getMno(), rpvo.getTargetMno(),
					rpvo.getReportTitle(), rpvo.getRegAt());
		}
	}
	@Test
	public void removeReportTest() throws Exception {
		int isUp = rpsv.remove(3);
		log.info(">>> Test of delete Report : {} ", isUp > 0 ? "OK":"FAIL");
	}
}
