package com.shoebid.www.service;

import java.util.List;

import com.shoebid.www.domain.ProductDTO;
import com.shoebid.www.domain.ProductVO;


public interface ProductService {
	int register(ProductDTO pdto);
	List<ProductVO> getList();
	ProductDTO getDetail(long pno);
	int modify(ProductVO pvo);
	int remove(long pno);
}
