package com.shoebid.www.service;

import java.util.List;

import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.ProductDTO;
import com.shoebid.www.domain.ProductVO;


public interface ProductService {
	int register(ProductDTO pdto);
	List<ProductVO> getList(PagingVO pgvo);
	ProductDTO getDetail(long pno);
	int modify(ProductDTO pdto);
	int remove(long pno);
	int getTotalCount();
	int removeFile(String uuid);
}
