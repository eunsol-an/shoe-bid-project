package com.shoebid.www.domain;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Alias("ivo")
public class ImageFileVO {
	private String uuid;
	private String saveDir;
	private String imageName;
	private long imageSize;
	private long pno;
	private long mno;
	private long rno;
	private String regAt;
}
