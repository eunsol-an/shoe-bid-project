package com.shoebid.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.shoebid.www.domain.ImageFileVO;
import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.ProductDTO;
import com.shoebid.www.domain.ProductVO;
import com.shoebid.www.repository.ImageFileDAO;
import com.shoebid.www.repository.ProductDAO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class ProductServiceImpl implements ProductService {
	@Inject
	ProductDAO pdao;
	@Inject
	private ImageFileDAO idao;
	
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

	@Override
	public List<ProductVO> getList(PagingVO pgvo) {
		return pdao.selectList(pgvo);
	}
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public ProductDTO getDetail(long pno) {
		int isUp = pdao.updateReadCount(pno, 1);
		String nick_name = pdao.selectNickName(pno);
		int maxPrice = pdao.selectMaxPrice(pno);
		
		List<ImageFileVO> imageList= idao.selectListPImage(pno);
		return new ProductDTO(pdao.selectDetail(pno),
				maxPrice, 
				nick_name, 
				imageList);
	}
	@Transactional
	@Override
	public int modify(ProductDTO pdto) {
		int isUp = pdao.updateReadCount(pdto.getPvo().getPno(), -2);
		isUp =pdao.update(pdto.getPvo());
		if(pdto.getImageList() != null ) {
			log.info(">>>>수정파일 있을경우 서비스");
				isUp = idao.deleteAllPImage(pdto.getPvo().getPno());
				for (ImageFileVO ivo :pdto.getImageList() ) {
					ivo.setPno(pdto.getPvo().getPno());
					isUp *= idao.insertPImage(ivo);
					log.info(">>>>수정파일 있을경우 파일서버등록"); 
			}
		}
		return isUp;
	}

	@Override
	public int remove(long pno) {
		int isUp =pdao.delete(pno);
		if(isUp> 0) {
		 isUp = idao.deleteAllPImage(pno);
		}
		return isUp;
	}

	@Override
	public int getTotalCount(PagingVO pgvo) {
		return pdao.selectTotalCount(pgvo);
	}

	@Override
	public int removeFile(String uuid) {
		return idao.deleteImage(uuid);
	}

	@Override
	public int statusProduct(ProductVO pvo) {
		
		
		return pdao.updateStatus(pvo);
	}

}
