package com.shoebid.www.service;

import java.util.List;


import com.shoebid.www.domain.ProductVO;


public interface ProductService {
	int register(ProductVO pvo);
	List<ProductVO> getList();
	ProductVO getDetail(long pno);
	int modify(ProductVO pvo);
	int remove(long pno);
}
