package com.shoebid.www.domain;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Alias("mdto")
public class MemberDTO {
	private MemberVO mvo;
	private List<ImageFileVO> imageList;
	private PagingVO pgvo;
	
	public MemberDTO() {}

	public MemberDTO(MemberVO mvo, List<ImageFileVO> imageList) {
		this.mvo = mvo;
		this.imageList = imageList;
	}

	public MemberDTO(MemberVO mvo, List<ImageFileVO> imageList, PagingVO pgvo) {
		this.mvo = mvo;
		this.imageList = imageList;
		this.pgvo = pgvo;
	}
	
	
}
