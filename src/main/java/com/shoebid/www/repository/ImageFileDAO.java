package com.shoebid.www.repository;

import java.util.List;

import com.shoebid.www.domain.ImageFileVO;

public interface ImageFileDAO {
	int insertPImage(ImageFileVO ivo);
	int insertMImage(ImageFileVO ivo);
	int insertRImage(ImageFileVO ivo);
	List<ImageFileVO> selectListPImage(long pno);
	List<ImageFileVO> selectListMImage(long mno);
	List<ImageFileVO> selectListRImage(long rno);
	int deleteImage(String uuid);
	int deleteAllPImage(long pno);
	int deleteAllMImage(long mno);
	int deleteAllRImage(long rno);
	List<ImageFileVO> selectAllImages();
}
