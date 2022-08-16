package com.shoebid.www.domain;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@Alias("mvo")
public class MemberVO {
	private long mno;
	private String id;
	private String email;
	private String pwd;
	private String nickName;
	private int grade;
	private int reportCount;
	private String memberImg;
	private String regAt;
	private String delAt;
	
	// register
	public MemberVO(String id, String email, String pwd, String nickName, String memberImg) {
		this.id = id;
		this.email = email;
		this.pwd = pwd;
		this.nickName = nickName;
		this.memberImg = memberImg;
	}
	// list
	public MemberVO(long mno, String id, String email, String nickName, int grade, String memberImg) {
		this.mno = mno;
		this.id = id;
		this.email = email;
		this.nickName = nickName;
		this.grade = grade;
		this.memberImg = memberImg;
	}
	// modify
	public MemberVO(long mno, String id, String pwd, String nickName, int grade, int reportCount, String memberImg) {
		this.mno = mno;
		this.id = id;
		this.pwd = pwd;
		this.nickName = nickName;
		this.grade = grade;
		this.reportCount = reportCount;
		this.memberImg = memberImg;
	}
	// detail
	public MemberVO(long mno, String id, String email, String pwd, String nickName, int grade, int reportCount,
			String memberImg, String regAt, String delAt) {
		this.mno = mno;
		this.id = id;
		this.email = email;
		this.pwd = pwd;
		this.nickName = nickName;
		this.grade = grade;
		this.reportCount = reportCount;
		this.memberImg = memberImg;
		this.regAt = regAt;
		this.delAt = delAt;
	}
	// login
	public MemberVO(String id, String pwd) {
		this.id = id;
		this.pwd = pwd;
	}
	// remove
	public MemberVO(long mno, String delAt) {
		this.mno = mno;
		this.delAt = delAt;
	}
	public MemberVO(String id, String email, String pwd) {
		this.id = id;
		this.email = email;
		this.pwd = pwd;
	}
	
	
	
}
