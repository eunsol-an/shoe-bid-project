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

import com.shoebid.www.domain.MemberDTO;
import com.shoebid.www.domain.MemberVO;
import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.ReportVO;
import com.shoebid.www.handler.PagingHandler;
import com.shoebid.www.service.MemberService;
import com.shoebid.www.service.ReportService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/report/*")
@Controller
public class ReportController {
	@Inject
	private ReportService rpsv;
	
	@Inject
	private MemberService msv;
	
	@GetMapping("/register")
	public void register(Model model, @RequestParam("mno") long mno) {	
		MemberDTO mdto = msv.getDetail(mno); 
		 MemberVO mvo = mdto.getMvo(); 
		 model.addAttribute("mvo", mvo); 
	}
	
	@PostMapping("/register")
	public String register(ReportVO rpvo, RedirectAttributes rttr) {
		
		int isUp = rpsv.register(rpvo);
		log.info(">>> report register {} - post : {}", isUp > 0 ? "OK":"FAIL");
		return "redirect:/report/list/" + rpvo.getMno();
	}
	@GetMapping("/list/{mno}")
	public String list(Model model, PagingVO pgvo , @PathVariable("mno") long mno) {
		model.addAttribute("list", rpsv.getList(mno, pgvo));
		int totalCount = rpsv.getTotalCount(mno);
		model.addAttribute("pgn", new PagingHandler(pgvo, totalCount));
		return "/report/list";
	}
	@GetMapping("/listall/{mno}")
	public String listall(Model model, PagingVO pgvo , @PathVariable("mno") long mno) {
		model.addAttribute("listall", rpsv.getAllList(mno, pgvo));
		int totalCount = rpsv.getTotalAllCount(mno);
		model.addAttribute("pgn", new PagingHandler(pgvo, totalCount));
		return "/report/listall";
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
