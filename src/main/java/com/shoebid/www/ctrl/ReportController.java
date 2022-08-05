package com.shoebid.www.ctrl;

import javax.inject.Inject;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.ReportVO;
import com.shoebid.www.handler.PagingHandler;
import com.shoebid.www.service.ReportService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/report/*")
@Controller
public class ReportController {
	@Inject
	private ReportService rpsv;
	
	@GetMapping("/register")
	public void register() {		
	}
	@PostMapping("/register")
	public String register(ReportVO rpvo, RedirectAttributes rttr) {
		
		int isUp = rpsv.register(rpvo);
		log.info(">>> report register {} - post : {}", isUp > 0 ? "OK":"FAIL");
		return "redirect:/report/list";
	}
	@GetMapping("/list")
	public void list(Model model, PagingVO pgvo) {
		model.addAttribute("list", rpsv.getList(pgvo));
		int totalCount = rpsv.getTotalCount();
		model.addAttribute("pgn", new PagingHandler(pgvo, totalCount));
	}
	@GetMapping("/detail")
	public void detail(@RequestParam("rpno") long rpno, Model model) {
		log.info(">>> report detail - get");
		model.addAttribute("rpvo", rpsv.getDetail(rpno));
	}
	@PostMapping("/remove")
	public String remove(@RequestParam("rpno") long rpno, RedirectAttributes rttr) {
		int isUp = rpsv.remove(rpno);
		log.info(">>> report remove {} - post : {}", isUp > 0 ? "OK":"FAIL");
		return "redirect:/report/list";
	}
}
