package com.shoebid.www.domain;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@Alias("rpvo")
public class ReportVO {
	private long rpno;
	private long mno;
	private long targetMno;
	private String reportTitle; 
	private String reportContent;
	private String regAt;
	private String nickName;
	private String targetNickName;
	
	// register
	public ReportVO(long mno, long targetMno, String reportTitle, String reportContent) {
		this.mno = mno;
		this.targetMno = targetMno;
		this.reportTitle = reportTitle;
		this.reportContent = reportContent;
	}
	//list
	public ReportVO(long rpno, long mno, long targetMno, String reportTitle, String regAt) {
		this.rpno = rpno;
		this.mno = mno;
		this.targetMno = targetMno;
		this.reportTitle = reportTitle;
		this.regAt = regAt;
	}

	
	



	
}
