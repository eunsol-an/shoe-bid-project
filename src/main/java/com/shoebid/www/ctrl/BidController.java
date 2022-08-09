package com.shoebid.www.ctrl;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shoebid.www.domain.BidVO;
import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.handler.PagingHandler;
import com.shoebid.www.service.BidService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/buy_bid/*")
public class BidController {

	@Inject
	private BidService bsv;
	
	@GetMapping("/add")
	public void add() {
		log.info(">>> BidController > add - GET");
	}
	
	@PostMapping("/add")
	public String add(BidVO bvo) {
		int isUp = bsv.register(bvo);
		log.info(">>> BidController > add - POST : {} ", isUp);
		log.info(">>> BidController > add - POST : {} ", bvo);
		return "redirect:/buy_bid/complete"; 
	}
	
	@GetMapping("/complete")
	public void complete() {
		log.info(">>> BidController > complete - GET");
	}
	
	@GetMapping("/list/{mno}")
	public String list(
			Model model
			, PagingVO pgvo
			, @PathVariable("mno") long mno) {
		log.info(">>> BidController > list - GET");
		
		model.addAttribute("list", bsv.getList(mno, pgvo));
		int totalCount = bsv.getTotalCount(mno, pgvo);
		model.addAttribute("pgn", new PagingHandler(pgvo, totalCount));
		return "/buy_bid/list";
	}
}
