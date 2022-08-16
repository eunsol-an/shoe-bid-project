package com.shoebid.www.domain;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Alias("rvvo")
public class ReviewVO {
	private long rvno;
	private long pno;
	private long sendMno;
	private long recvMno;
	private String content;
	private int score;
	private String regAt;
	
	private String sendNick;
	private String recvNick;
	private String pname;
	
	public ReviewVO() {}

	public ReviewVO(long pno, long sendMno, long recvMno, String content, int score) {
		this.pno = pno;
		this.sendMno = sendMno;
		this.recvMno = recvMno;
		this.content = content;
		this.score = score;
	}

	public ReviewVO(long rvno, String content, int score) {
		this.rvno = rvno;
		this.content = content;
		this.score = score;
	}

}
