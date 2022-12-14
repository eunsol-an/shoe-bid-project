package com.shoebid.www.handler;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

import com.shoebid.www.domain.QuestionVO;
import com.shoebid.www.domain.ReviewVO;
import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.ProductPagingVO;

@Getter
@Setter
public class PagingHandler {
	private int startPage; 
	private int endPage; 
	private boolean prev, next;
	
	private int totalCount; 
	private PagingVO pgvo; 
	private ProductPagingVO ppgvo;
	private List<QuestionVO> questionList;
	private List<ReviewVO> reviewList;
	
	public PagingHandler(PagingVO pgvo, int totalCount) {
		this.pgvo = pgvo;
		this.totalCount = totalCount;
		
		this.endPage
			= (int)(Math.ceil(pgvo.getPageNo() / (pgvo.getQty()*1.0))) * pgvo.getQty();
		this.startPage = endPage - 9;
		
		int realEndPage = (int)(Math.ceil((totalCount * 1.0) / pgvo.getQty()));
		
		if(realEndPage < this.endPage) {
			this.endPage = realEndPage;
		}
		
		this.prev = startPage > 1;
		this.next = endPage < realEndPage;
	}
	
	public PagingHandler(ProductPagingVO ppgvo, int totalCount) {
		this.ppgvo = ppgvo;
		this.totalCount = totalCount;

		this.endPage = (int) (Math.ceil(ppgvo.getPageNo() / (10 * 1.0))) * 10;
		this.startPage = endPage -9;
		int realEndPage = (int) (Math.ceil((totalCount * 1.0) / ppgvo.getQty()));
		if (realEndPage < this.endPage) {
			this.endPage = realEndPage;
		}
		this.prev = startPage > 1; 
		this.next = endPage < realEndPage;
	}
	
	public PagingHandler(List<QuestionVO> questionList,
			PagingVO pgvo, int totalCount) {
		this(pgvo, totalCount);
		this.questionList = questionList;
	}
	
	public PagingHandler(List<ReviewVO> reviewList, 
			int totalCount, PagingVO pgvo) {
		this(pgvo, totalCount);
		this.reviewList = reviewList;
	}
}
