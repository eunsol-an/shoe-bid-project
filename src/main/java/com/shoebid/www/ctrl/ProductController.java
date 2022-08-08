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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shoebid.www.domain.ImageFileVO;
import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.ProductDTO;
import com.shoebid.www.domain.ProductVO;
import com.shoebid.www.handler.ImageFileHandler;
import com.shoebid.www.handler.PagingHandler;
import com.shoebid.www.service.ProductService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@RequestMapping("/product/*")
@Controller
public class ProductController {
	@Inject
	private ProductService psv;
	
	@Inject
	private ImageFileHandler fhd;
	
	@GetMapping("/list")
	public void list(Model model, PagingVO pgvo) {
		model.addAttribute("list", psv.getList(pgvo));
		int totalCount = psv.getTotalCount();
		model.addAttribute("pgn",new PagingHandler(pgvo, totalCount));
	}
	
	@GetMapping("/register")
	public void register() {}
	
	@PostMapping("/register")
	public String register(ProductVO pvo, RedirectAttributes rttr,
			@RequestParam(name = "fileAttached", required = true) MultipartFile[] files) {
		Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        cal.add(Calendar.DATE, Integer.parseInt(pvo.getEndTime()));
        pvo.setEndTime(df.format(cal.getTime()).toString());
        log.info(">>>end_time-->{}",df.format(cal.getTime()));
			
		List<ImageFileVO> fileList =fhd.getImageFileList(files);
		pvo.setProductImg(fileList.get(0).getSaveDir()+"\\" +fileList.get(0).getUuid()+"_th"+fileList.get(0).getImageName());
		 int isUp = psv.register(new ProductDTO(pvo, fileList));
		return "redirect:/product/list";
	}
	@GetMapping({"/detail", "/modify"})
	public void detail(@RequestParam("pno") long pno, Model model,
			@ModelAttribute("pgvo") PagingVO pgvo) {
		model.addAttribute("pdto", psv.getDetail(pno));
	}
	@PostMapping("/modify")
	public String modify(ProductVO pvo,	@RequestParam(name="fileAttached", required = false) MultipartFile[] files,
			RedirectAttributes rttr,
			PagingVO pgvo) {
		Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        cal.add(Calendar.DATE, Integer.parseInt(pvo.getEndTime()));
        pvo.setEndTime(df.format(cal.getTime()).toString());
		List<ImageFileVO> fileList = null;
		if(files[0].getSize() > 0) {
			fileList = fhd.getImageFileList(files);
		}
		
		int isUp = psv.modify(new ProductDTO(pvo, fileList));
		rttr.addAttribute("pageNo", pgvo.getPageNo());
		rttr.addAttribute("qty", pgvo.getQty());
		return "redirect:/product/detail?pno="+pvo.getPno();
	}
	@PostMapping("/remove")
	public String remove(@RequestParam("pno") long pno, RedirectAttributes rttr, PagingVO pgvo) {
		int isUp = psv.remove(pno);
		rttr.addAttribute("pageNo", pgvo.getPageNo());
		rttr.addAttribute("qty", pgvo.getQty());
		return "redirect:/product/list";
	}

	@DeleteMapping(value = "/file/{uuid}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> removeFile(@PathVariable("uuid") String uuid){		
		return psv.removeFile(uuid) > 0 ?
				new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}