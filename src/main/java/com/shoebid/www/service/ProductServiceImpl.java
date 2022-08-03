package com.shoebid.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shoebid.www.domain.ProductVO;
import com.shoebid.www.repository.ProductDAO;
@Service
public class ProductServiceImpl implements ProductService {
	@Inject
	ProductDAO pdao;
	
	@Override
	public int register(ProductVO pvo) {
		return pdao.insert(pvo);
	}

	@Override
	public List<ProductVO> getList() {
		return pdao.selectList();
	}

	@Override
	public ProductVO getDetail(long pno) {
		return pdao.selectDetail(pno);
	}

	@Override
	public int modify(ProductVO pvo) {
		return pdao.update(pvo);
	}

	@Override
	public int remove(long pno) {
		return pdao.delete(pno);
	}

}
