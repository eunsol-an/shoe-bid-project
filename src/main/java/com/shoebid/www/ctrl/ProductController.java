package com.shoebid.www.ctrl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
import com.shoebid.www.service.ProductService;

@RequestMapping("/product/*")
@Controller
public class ProductController {
	@Inject
	private ProductService psv;
	
	@Inject
	private ImageFileHandler fhd;
	
	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list", psv.getList());
	}
	
	@GetMapping("/register")
	public void register() {}
	
	@PostMapping("/register")
	public String register(ProductVO pvo, RedirectAttributes rttr,
			@RequestParam(name = "fileAttached", required = true) MultipartFile[] files) {
		List<ImageFileVO> fileList = fhd.getImageFileList(files);
		pvo.setProductImg(fileList.get(0).getSaveDir()+"\\"+fileList.get(0).getUuid()+"_th_"+fileList.get(0).getImageName());
		 int isUp = psv.register(new ProductDTO(pvo, fileList));
		return "redirect:/product/list";
	}
	@GetMapping({"/detail", "/modify"})
	public void detail(@RequestParam("pno") long pno, Model model) {
		model.addAttribute("pdto", psv.getDetail(pno));
	}

}
