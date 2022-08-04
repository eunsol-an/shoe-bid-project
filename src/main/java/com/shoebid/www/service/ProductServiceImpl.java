package com.shoebid.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shoebid.www.domain.ProductDTO;
import com.shoebid.www.domain.ProductVO;
import com.shoebid.www.repository.ProductDAO;
@Service
public class ProductServiceImpl implements ProductService {
	@Inject
	ProductDAO pdao;
	
	@Override
	public int register(ProductDTO pdto) {
		return pdao.insert(pdto.getPvo());
	}

	@Override
	public List<ProductVO> getList() {
		return pdao.selectList();
	}
	@Transactional
	@Override
	public ProductDTO getDetail(long pno) {
		int isUp = pdao.updateReadCount(pno, 1);
		String nick_name = pdao.selectNickName(pno);
		int maxPrice = pdao.selectMaxPrice(pno);
		List<ImageFileVO> imageList= null;
		return new ProductDTO(pdao.selectDetail(pno),
				maxPrice, 
				nick_name, 
				imageList);
	}
	@Transactional
	@Override
	public int modify(ProductVO pvo) {
		int isUp = pdao.updateReadCount(pvo.getPno(), -2);
		isUp =pdao.update(pvo);
		return isUp;
	}

	@Override
	public int remove(long pno) {
		return pdao.delete(pno);
	}

}
