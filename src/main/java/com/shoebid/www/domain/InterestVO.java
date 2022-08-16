package com.shoebid.www.domain;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@Alias("itvo")
@ToString
public class InterestVO {
	private long ino;
	private long mno;
	private long pno;
	
	private String pname;
	private String productImg;
	private String regAt;
	private String endTime;
	private String reservePrice;
	private int itck;
	private boolean readCk;
	
	public InterestVO(long mno, long pno) {
		this.mno = mno;
		this.pno = pno;
	}
	
	
}
