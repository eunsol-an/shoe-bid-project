package com.shoebid.www.ctrl;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shoebid.www.domain.MemberVO;
import com.shoebid.www.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Inject
	private MemberService msv;

	@GetMapping("/register")
	public void register() {
		log.info(">>> MemberController > register - GET");
	}
	@PostMapping("/register")
	public String register(MemberVO mvo) {
		int isUp = msv.register(mvo);
		log.info(">>> member register - post : {}", isUp > 0 ? "OK":"FAIL");
		return "redirect:/";
	}
	@GetMapping("/list")
	public void list(Model model) {
		log.info(">>> member list - get");
		List<MemberVO> list = msv.getList();
		model.addAttribute("list", list);
	}
	@GetMapping({"/detail", "/modify"})
	public void detail(Model model, @RequestParam("mno") long mno) {
		MemberVO mvo = msv.getDetail(mno);
		model.addAttribute("mvo",mvo);
	}
	@PostMapping("/modify")
	public String modify(MemberVO mvo) {
		int isUp = msv.modify(mvo);
		log.info(">>> member modify - post : {}", isUp > 0 ? "OK":"FAIL");
		return "redirect:/member/detail?mno="+mvo.getMno();
	}
	@PostMapping("/remove")
	public String remove(@RequestParam("mno") long mno) {
		int isUp = msv.remove(mno);
		log.info(">>> member remove - post : {}", isUp > 0 ? "OK":"FAIL");
		return "redirect:/";
	}
	@GetMapping("/login")
	public void login() {
		log.info(">>> member login - get");
	}
	@PostMapping("/login")
	public String login(MemberVO mvo, HttpSession ses, RedirectAttributes rttr) {
		MemberVO sesMvo = msv.login(mvo);
		if(sesMvo != null) {
			log.info(">>> member login - OK");
			ses.setAttribute("ses", sesMvo);
			ses.setMaxInactiveInterval(10*60);
			rttr.addFlashAttribute("isLogin", 1);
			return "redirect:/";
		}else {
			return "redirect:/member/login";
		}
	}
	@GetMapping("logout")
	public String logout(HttpSession ses, RedirectAttributes rttr) {
		ses.removeAttribute("ses");
		ses.invalidate();
		rttr.addFlashAttribute("isLogout", 1);
		return "redirect:/";
	}
}
