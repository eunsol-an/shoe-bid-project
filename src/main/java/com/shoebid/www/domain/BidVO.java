package com.shoebid.www.domain;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Alias("bvo")
public class BidVO {
	private long bno;
	private long buyer;
	private long pno;
	private int bidPrice;
	private int bidStatus;
	private String bidAt;
	
	private String nickName;
	private String pname;
	private String productImg;
	
	public BidVO() {}

	public BidVO(long buyer, long pno, int bidPrice, int bidStatus) {
		this.buyer = buyer;
		this.pno = pno;
		this.bidPrice = bidPrice;
		this.bidStatus = bidStatus;
	}
	
}
