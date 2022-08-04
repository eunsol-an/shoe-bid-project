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
	private long writer;
	private long pno;
	private String content;
	private String regAt;
	private String modAt;
	private String nickName;

	public QuestionVO() {}
	
	// insert
	public QuestionVO(long qno, long writer, String content) {
		this.qno = qno;
		this.writer = writer;
		this.content = content;
	}
	
	// list
	public QuestionVO(long qno, long writer, long pno, String content, String modAt) {
		this.qno = qno;
		this.writer = writer;
		this.pno = pno;
		this.content = content;
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