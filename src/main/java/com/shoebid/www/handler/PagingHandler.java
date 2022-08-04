package com.shoebid.www.handler;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

import com.shoebid.www.domain.QuestionVO;
import com.shoebid.www.domain.PagingVO;

@Getter
@Setter
public class PagingHandler {
	private int startPage; 
	private int endPage; 
	private boolean prev, next;
	
	private int totalCount; 
	private PagingVO pgvo; 
	private List<QuestionVO> questionList;
	
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

	public PagingHandler(List<QuestionVO> questionList,
			PagingVO pgvo, int totalCount) {
		this(pgvo, totalCount);
		this.questionList = questionList;
	}
}
