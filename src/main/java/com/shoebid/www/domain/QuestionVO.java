package com.shoebid.www.domain;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@Alias("qvo")
public class QuestionVO {
	private long qno;
	private long pno;
	private long parent;
	private String content;
	private long writer;
	private String regAt;
	private String modAt;
	private String nickName;
	private int isDeleted;
	private int isAnswer;
	private String memberImg;

	
	public QuestionVO() {} 

	// insert
	public QuestionVO(long pno, long parent, String content, long writer) {
		this.pno = pno;
		this.parent = parent;
		this.content = content;
		this.writer = writer;
	}
	public QuestionVO(long pno,  String content, long writer) {
		this.pno = pno;
		this.content = content;
		this.writer = writer;
	}

	// list
	public QuestionVO(long qno, long pno, long parent, String content, long writer, String modAt) {
		this.qno = qno;
		this.pno = pno;
		this.parent = parent;
		this.content = content;
		this.writer = writer;
		this.modAt = modAt;
	}

	// modify
	public QuestionVO(long qno, String content) {
		this.qno = qno;
		this.content = content;
	}

	// remove
	public QuestionVO(long qno) {
		this.qno = qno;
	}
}