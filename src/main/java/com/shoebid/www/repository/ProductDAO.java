package com.shoebid.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.ProductVO;


public interface ProductDAO {
	int insert(ProductVO pvo);
	List<ProductVO> selectList(PagingVO pgvo);
	int update(ProductVO pvo);
	int delete(long pno);
	int updateHighestPrice(@Param("highestPrice") long highestPrice,
			@Param("pno") long pno);
	int updateReadCount( @Param("pno") long pno,@Param("i") int i);
	int updateStatus( @Param("pno") long pno ,@Param("status") int status );
	ProductVO selectDetail(long pno);
	String selectNickName(long pno);
	int selectMaxPrice(long pno);
	int selectTotalCount();
	long selectLastPno();
}

