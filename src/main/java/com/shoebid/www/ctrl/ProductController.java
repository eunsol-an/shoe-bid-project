package com.shoebid.www.ctrl;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shoebid.www.domain.ImageFileVO;
import com.shoebid.www.domain.MemberVO;
import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.ProductDTO;
import com.shoebid.www.domain.ProductPagingVO;
import com.shoebid.www.domain.ProductVO;
import com.shoebid.www.handler.ImageFileHandler;
import com.shoebid.www.handler.PagingHandler;
import com.shoebid.www.service.InterestService;
import com.shoebid.www.service.ProductService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@RequestMapping("/product/*")
@Controller
public class ProductController {
	@Inject
	private ProductService psv;
	
	@Inject
	private InterestService itsv;
	
	@Inject
	private ImageFileHandler fhd;
	
	@GetMapping("/list")
	public void list(Model model, ProductPagingVO ppgvo) {
		model.addAttribute("list", psv.getList(ppgvo));
		int totalCount = psv.getTotalCount(ppgvo);
		model.addAttribute("pgn",new PagingHandler(ppgvo, totalCount));
	}
	@GetMapping("/sellList/{mno}")
	public String sellList(Model model,   PagingVO pgvo, @PathVariable("mno") long mno){
		model.addAttribute("list", psv.getSellList(pgvo,mno));
		int totalCount = psv.getSellTotalCount(pgvo,mno);
		model.addAttribute("pgn",new PagingHandler(pgvo, totalCount));
		return "/product/sellList";
	}
	
	@GetMapping("/register")
	public void register() {}
	
	@PostMapping("/register")
	public String register(ProductVO pvo, RedirectAttributes rttr,
			@RequestParam(name = "fileAttached", required = true) MultipartFile[] files,
			@RequestParam(name = "mainFileAttached", required = true) MultipartFile mainFiles) {
		Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        cal.add(Calendar.DATE, Integer.parseInt(pvo.getEndTime()));
        pvo.setEndTime(df.format(cal.getTime()).toString());
        
		ImageFileVO ivo = fhd.getMainImageFileList(mainFiles, true);
		List<ImageFileVO> fileList =fhd.getImageFileList(files, true);
		fileList.add(0,ivo);
		pvo.setProductImg(fileList.get(0).getSaveDir()+"\\" +fileList.get(0).getUuid()+"_th"+fileList.get(0).getImageName());
		 int isUp = psv.register(new ProductDTO(pvo, fileList));
		return "redirect:/product/list";
	}
	
	@GetMapping({"/detail", "/modify"}) 
	public void detail(@RequestParam("pno") long pno, @RequestParam(name="mno", required = false) long mno, Model model,
			@ModelAttribute("pgvo") ProductPagingVO pgvo) {
		model.addAttribute("pdto", psv.getDetail(pno));
			model.addAttribute("itck", itsv.getItCheck(pno, mno));
	}

	
	@PostMapping("/modify") 
	public String modify(ProductVO pvo,	@RequestParam(name="fileAttached", required = false) MultipartFile[] files,
			@RequestParam(name = "mainFileAttached", required = false) MultipartFile mainFile,
			RedirectAttributes rttr, ProductPagingVO ppgvo) {
		Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        cal.add(Calendar.DATE, Integer.parseInt(pvo.getEndTime()));
        pvo.setEndTime(df.format(cal.getTime()).toString());
        
        ImageFileVO ivo = null;
		List<ImageFileVO> fileList = null;
		if(mainFile.getSize()>0 && files[0].getSize() > 0) {
			ivo = fhd.getMainImageFileList(mainFile, true);
			fileList = fhd.getImageFileList(files, true);
			fileList.add(0, ivo);
			log.info(">>>>>>>>>>>>>>>파일수정시 들어옴");
			pvo.setProductImg(fileList.get(0).getSaveDir()+"\\" +fileList.get(0).getUuid()+"_th"+fileList.get(0).getImageName());
		}
		log.info(">>>>>>>>>>>>>>>파일이름{}",pvo.getProductImg());
		int isUp = psv.modify(new ProductDTO(pvo, fileList));
		rttr.addAttribute("pageNo", ppgvo.getPageNo());
		rttr.addAttribute("qty", ppgvo.getQty());
		rttr.addAttribute("type", ppgvo.getType());
		rttr.addAttribute("kw", ppgvo.getKw());
		rttr.addAttribute("orderBy", ppgvo.getOrderBy());
		rttr.addAttribute("mno", 0);
		return "redirect:/product/detail?pno="+pvo.getPno();
	}
	@PostMapping("/remove")
	public String remove(@RequestParam("pno") long pno, RedirectAttributes rttr, ProductPagingVO ppgvo) {
		int isUp = psv.remove(pno);
		rttr.addAttribute("pageNo", ppgvo.getPageNo());
		rttr.addAttribute("qty", ppgvo.getQty());
		rttr.addAttribute("type", ppgvo.getQty());
		rttr.addAttribute("kw", ppgvo.getQty());
		rttr.addAttribute("orderBy", ppgvo.getOrderBy());
		return "redirect:/product/list";
	}

}
