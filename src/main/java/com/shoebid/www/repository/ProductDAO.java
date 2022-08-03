package com.shoebid.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shoebid.www.domain.ProductVO;


public interface ProductDAO {
	int insert(ProductVO pvo);
	List<ProductVO> selectList();
	int update(ProductVO pvo);
	int delete(long pno);
	int updateHighestPrice(@Param("highestPrice") long highestPrice,
			@Param("pno") long pno);
	int updateReadCount(@Param("i") int i, @Param("pno") long pno);
	int updateStatus(@Param("status") int status , @Param("pno") long pno);
	ProductVO selectDetail(long pno);
}

