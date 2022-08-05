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
@Alias("avo")
public class AnswerVO {
	private long ano;
	private long qno;
	private long writer;
	private String content;
	private String regAt;
	private String modAt;
	private String nickName;
	
	public AnswerVO() {}
	
	// insert
	public AnswerVO(long ano, long writer, String content) {
		this.ano = ano;
		this.writer = writer;
		this.content = content;
	}

	// list
	public AnswerVO(long ano, long qno, long writer, String content, String modAt) {
		this.ano = ano;
		this.qno = qno;
		this.writer = writer;
		this.content = content;
		this.modAt = modAt;
	}
	
	// modify
	public AnswerVO(long ano, String content) {
		this.ano = ano;
		this.content = content;
	}

	// delete
	public AnswerVO(long ano) {
		this.ano = ano;
	}


}
