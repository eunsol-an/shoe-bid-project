package com.shoebid.www.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.shoebid.www.domain.BidVO;
import com.shoebid.www.domain.ImageFileVO;
import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.ProductDTO;
import com.shoebid.www.domain.ProductPagingVO;
import com.shoebid.www.domain.ProductVO;
import com.shoebid.www.repository.BidDAO;
import com.shoebid.www.repository.ImageFileDAO;
import com.shoebid.www.repository.MemberDAO;
import com.shoebid.www.repository.ProductDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProductServiceImpl implements ProductService {
	@Inject
	private ProductDAO pdao;
	@Inject
	private ImageFileDAO idao;
	@Inject
	private BidDAO bdao;
	@Inject
	private MemberDAO mdao;

	@Transactional
	@Override
	public int register(ProductDTO pdto) {
		int isUp = pdao.insert(pdto.getPvo());
		for (ImageFileVO ivo : pdto.getImageList()) {
			long pno = pdao.selectLastPno();
			ivo.setPno(pno);
			isUp *= idao.insertPImage(ivo);
		}
		return isUp;
	}
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public List<ProductVO> getList(ProductPagingVO ppgvo) {
		return pdao.selectList(ppgvo);
	}
 
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public ProductDTO getDetail(long pno) {
		int isUp = pdao.updateReadCount(pno, 1);
		String nick_name = pdao.selectNickName(pno);
		int maxPrice = pdao.selectMaxPrice(pno);

		List<ImageFileVO> imageList = idao.selectListPImage(pno);
		return new ProductDTO(pdao.selectDetail(pno), maxPrice, nick_name, imageList);
	}

	@Transactional
	@Override
	public int modify(ProductDTO pdto) {
		int isUp = pdao.updateReadCount(pdto.getPvo().getPno(), -2);
		isUp = pdao.update(pdto.getPvo());
		if (pdto.getImageList() != null) {
			isUp = idao.deleteAllPImage(pdto.getPvo().getPno());
			for (ImageFileVO ivo : pdto.getImageList()) {
				ivo.setPno(pdto.getPvo().getPno());
				isUp *= idao.insertPImage(ivo);
			}
		}
		return isUp;
	}

	@Override
	public int remove(long pno) {
		int isUp = pdao.delete(pno);
		if (isUp > 0) {
			isUp = idao.deleteAllPImage(pno);
		}
		return isUp;
	}

	@Override
	public int getTotalCount(ProductPagingVO ppgvo) {
		return pdao.selectTotalCount(ppgvo);
	}

	@Override
	public List<ProductVO> getSellList(PagingVO pgvo, long mno) {
		return pdao.selectSallList(pgvo, mno);
	}
	@Override
	public int getSellTotalCount(PagingVO pgvo, long mno) {
		return pdao.selectSellTotalCount(pgvo,mno);
	}

}
