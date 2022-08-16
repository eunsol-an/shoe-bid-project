package com.shoebid.www.ctrl;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.ProductDTO;
import com.shoebid.www.domain.ReviewVO;
import com.shoebid.www.handler.PagingHandler;
import com.shoebid.www.service.BidService;
import com.shoebid.www.service.ProductService;
import com.shoebid.www.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/review/*")
@Controller
public class ReviewController {
	@Inject
	private ReviewService rvsv;
	
	@Inject
	private ProductService psv;
	
	@Inject
	private BidService bsv;
	
	@GetMapping("/register")
	public void register(Model model, @RequestParam("pno") long pno, @RequestParam("mno") long mno) {
		ProductDTO pdto = psv.getDetail(pno);
		model.addAttribute("pdto", pdto); // 상품 디테일정보
		model.addAttribute("recvMno", mno); // 후기 보내는 상대 회원의 mno
		model.addAttribute("buyerNick", bsv.getBuyerNick(pno)); // 낙찰자의 닉네임
	}
	
	@PostMapping("/register")
	public String register(ReviewVO rvvo, RedirectAttributes rttr) {
		int isUp = rvsv.register(rvvo);
		log.info(">>> ReviewController > register > {}", isUp > 0 ? "OK":"FAIL");
		return "redirect:/review/list/" + rvvo.getSendMno() + "?type=s"; // 리뷰 작성 후 보낸 리뷰(type=s)로 이동
	}
	
	@GetMapping("/list/{mno}")
	public String list(
			Model model
			, PagingVO pgvo
			, @PathVariable("mno") long mno) {
		log.info(">>> ReviewController > list - GET");
		
		model.addAttribute("list", rvsv.getList(mno, pgvo));
		int totalCount = rvsv.getTotalCount(mno, pgvo);
		model.addAttribute("pgn", new PagingHandler(pgvo, totalCount));
		return "/review/list";
	}
	
	@GetMapping("/modify")
	public void modify(Model model, @RequestParam("pno") long pno, @RequestParam("mno") long mno, @RequestParam("rvno") long rvno) {
		ProductDTO pdto = psv.getDetail(pno);
		model.addAttribute("pdto", pdto); // 상품 디테일정보
		model.addAttribute("recvMno", mno); // 후기 보내는 상대 회원의 mno
		model.addAttribute("buyerNick", bsv.getBuyerNick(pno)); // 낙찰자의 닉네임
		model.addAttribute("rvvo", rvsv.getDetail(rvno));
	}
	
	@PostMapping("/modify")
	public String modify(ReviewVO rvvo) {
		int isUp = rvsv.modify(rvvo);
		log.info(">>> ReviewController > modify > {}", isUp > 0 ? "OK":"FAIL");
		return "redirect:/review/list/" + rvsv.getDetail(rvvo.getRvno()).getSendMno() + "?type=s"; // 리뷰 수정 후 보낸 리뷰(type=s)로 이동
	}
}
