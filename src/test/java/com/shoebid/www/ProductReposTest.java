package com.shoebid.www;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.shoebid.www.domain.ProductVO;
import com.shoebid.www.repository.ProductDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.shoebid.www.config.RootConfig.class})
public class ProductReposTest {
	
	@Inject
	private ProductDAO pdao;
	
	@Test
	public void insertProductTest() throws Exception{
		
		int isOk = pdao.insert(new ProductVO("cate", "pname","description",
											3L,"img",1000L,"2022-08-02 23:53:00"));
		log.info(">>>> insertTest-{}",isOk>0? "ok": "fail");
	}
	@Test
	public void ListProductTest() throws Exception{
		List<ProductVO> list = pdao.selectList();
		for (ProductVO pvo : list) {
			log.info("{}",pvo);
		}
	}
	
	@Test
	public void updatProductTest() throws Exception{
		
		int isOk = pdao.update(new ProductVO(1L, "cate1","pname2",
				"desc", "imgeeeee", 1000L, "2022-08-04 12:00"));
		log.info(">>>> insertTest-{}",isOk>0? "ok": "fail");
		
	}
	@Test
	public void detailproductTest() throws Exception{
		ProductVO pvo = pdao.selectDetail(1L);
		log.info("{}",pvo);
		
	}
	@Test
	public void deleteProductTest() throws Exception{
		int isDel = pdao.delete(1L);
		
		log.info(">>>> insertTest-{}",isDel>0? "ok": "fail");
		
		
	}
	
}
