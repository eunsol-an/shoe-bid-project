package com.shoebid.www.domain;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Alias("pvo")
public class ProductVO {
	private long pno;
	private String category;
	private String pname;
	private String description;
	private int readCount;
	private long writer;
	private String productImg;
	private int status;
	private long reservePrice;
	private long highestPrice;
	private String endTime;
	private String  regAt;
	private String modAt;
	private Long buyerMno;
	private String buyerNick;
	
	public ProductVO(String category, String pname, String description, long writer, String productImg,
			long reservePrice, String endTime) {
		this.category = category;
		this.pname = pname;
		this.description = description;
		this.writer = writer;
		this.productImg = productImg;
		this.reservePrice = reservePrice;
		this.endTime = endTime;
	}

	public ProductVO(long pno, String category, String pname, String description, String productImg, long reservePrice,
			String endTime) {
		this.pno = pno;
		this.category = category;
		this.pname = pname;
		this.description = description;
		this.productImg = productImg;
		this.reservePrice = reservePrice;
		this.endTime = endTime;
	}
	
	
}
