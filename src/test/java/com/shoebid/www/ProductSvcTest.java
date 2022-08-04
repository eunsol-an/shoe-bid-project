package com.shoebid.www;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.shoebid.www.domain.ProductDTO;
import com.shoebid.www.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.shoebid.www.config.RootConfig.class})
public class ProductSvcTest {
	@Inject
	private ProductService psv;
	
	@Test
	public void detailProductTest() throws Exception{
		ProductDTO pdto = psv.getDetail(2L);
		log.info(">>>>productDTO-->{}",pdto);
		
	}

}
