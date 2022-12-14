package com.shoebid.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shoebid.www.domain.MemberVO;
import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.ProductPagingVO;
import com.shoebid.www.domain.ProductVO;


public interface ProductDAO {
	int insert(ProductVO pvo);
	List<ProductVO> selectList(ProductPagingVO ppgvo);
	int update(ProductVO pvo);
	int delete(long pno);
	int updateHighestPrice(@Param("highestPrice") long highestPrice,
			@Param("pno") long pno);
	int updateReadCount( @Param("pno") long pno,@Param("i") int i);
	int updateStatus(ProductVO pvo );
	ProductVO selectDetail(long pno);
	MemberVO selectNickName(long pno); 
	int selectMaxPrice(long pno);
	int selectTotalCount(ProductPagingVO ppgvo);
	long selectLastPno(); 
	List<ProductVO> selectAllList(); 
	List<ProductVO> selectSallList(@Param("pgvo") PagingVO pgvo, @Param("mno") long mno);
	int selectSellTotalCount(@Param("pgvo") PagingVO pgvo, @Param("mno") long mno); 
}

