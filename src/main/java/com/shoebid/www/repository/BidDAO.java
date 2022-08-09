package com.shoebid.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shoebid.www.domain.BidVO;
import com.shoebid.www.domain.PagingVO;

public interface BidDAO {
	int insert(BidVO bvo); // 입찰하기
	List<BidVO> selectList(@Param("mno") long mno, @Param("pgvo") PagingVO pgvo); // 특정 회원의 입찰 리스트
	int selectTotalCount(@Param("mno") long mno, @Param("pgvo") PagingVO pgvo); // 페이징을 위한 특정 회원의 전체 입찰 갯수
	int updateBidStatus(BidVO bvo); // 경매 종료 후 입찰상태 변경
}
