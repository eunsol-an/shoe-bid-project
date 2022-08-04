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
	private String nick_name;
		
	private List<ImageFileVO> imageList;
	
	public ProductDTO() {}
	
	//register
	public ProductDTO(ProductVO pvo, List<ImageFileVO> imageList) {
		this.pvo = pvo;
		this.imageList = imageList;
	}
	
	//detail
	public ProductDTO(ProductVO pvo, int maxPrice, String nick_name, List<FImageFileVO> imageList) {
		this.pvo = pvo;
		this.maxPrice = maxPrice;
		this.nick_name = nick_name;
		this.imageList = imageList;
	}

	
	
	
	
}
