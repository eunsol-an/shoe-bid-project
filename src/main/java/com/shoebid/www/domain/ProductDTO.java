package com.shoebid.www.domain;

import java.util.List;


import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Alias("pdto")
public class ProductDTO {
	private ProductVO pvo;
	private int maxPrice;
	private MemberVO mvo;
	private int itQty;
		
	private List<ImageFileVO> imageList;
	
	public ProductDTO() {}
	
	//register
	public ProductDTO(ProductVO pvo, List<ImageFileVO> imageList) {
		this.pvo = pvo;
		this.imageList = imageList;
	}
	
	//detail
	public ProductDTO(ProductVO pvo, int maxPrice, MemberVO mvo, List<ImageFileVO> imageList, int itQty) {
		this.pvo = pvo;
		this.maxPrice = maxPrice;
		this.mvo = mvo;
		this.imageList = imageList;
		this.itQty = itQty;
	}

	
	
	
	
}
