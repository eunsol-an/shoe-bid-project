package com.shoebid.www.ctrl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shoebid.www.domain.ImageFileVO;
import com.shoebid.www.domain.MemberDTO;
import com.shoebid.www.domain.MemberVO;
import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.handler.ImageFileHandler;
import com.shoebid.www.handler.PagingHandler;
import com.shoebid.www.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Inject
	private MemberService msv;
	
	@Inject
	private ImageFileHandler fhd;

	@GetMapping("/register")
	public void register() {
		log.info(">>> MemberController > register - GET");
	}
	@PostMapping("/register")
	public String register(MemberVO mvo, RedirectAttributes rttr,
			@RequestParam(name = "fileAttached") MultipartFile[] files) {
		List<ImageFileVO> fileList = fhd.getImageFileList(files);
		mvo.setMemberImg(fileList.get(0).getSaveDir()+"\\" +fileList.get(0).getUuid()+fileList.get(0).getImageName());
		int isUp = msv.register(new MemberDTO(mvo, fileList));
		log.info(">>> member register - post : {}", isUp > 0 ? "OK":"FAIL");
		return "redirect:/member/login";
	}
	@GetMapping("/list")
	public void list(Model model, PagingVO pgvo) {
		log.info(">>> member list - get");
		model.addAttribute("list", msv.getList(pgvo));
		int totalCount = msv.getTotalCount();
		model.addAttribute("pgn", new PagingHandler(pgvo, totalCount));
	}
	@GetMapping({"/mypage", "/modify"})
	public void detail(Model model, @RequestParam("mno") long mno,
			@ModelAttribute("pgvo") PagingVO pgvo) {
		model.addAttribute("mdto",msv.getDetail(mno));
	}
	
	@PostMapping("/modify")
	public String modify(MemberVO mvo, @RequestParam(name="fileAttached", required = false) MultipartFile[] files,
			RedirectAttributes rttr) {
		List<ImageFileVO> fileList = null;
		if(files[0].getSize() > 0) {
			fileList = fhd.getImageFileList(files);
			mvo.setMemberImg(fileList.get(0).getSaveDir()+"\\"+fileList.get(0).getUuid()+fileList.get(0).getImageName());
		}
		int isUp = msv.modify(new MemberDTO(mvo, fileList));
		log.info(">>> member modify - post : {}", isUp > 0 ? "OK":"FAIL");
		return "redirect:/member/mypage?mno="+mvo.getMno();
	}
	@DeleteMapping(value = "/file/{uuid}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> removeFile(@PathVariable("uuid") String uuid){		
		return msv.removeFile(uuid) > 0 ?
				new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	@PostMapping("/remove")
	public String remove(MemberVO mvo) {
		int isUp = msv.remove(mvo);
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
	@ResponseBody
	@PostMapping(value = "/idDupleCheck", consumes = "application/json",
				produces = {MediaType.TEXT_PLAIN_VALUE})
	public String idDupleCheck(@RequestBody HashMap<String, String> map) {
		log.info(">>> {}", map.get("id"));
		int isExist = msv.idDupleCheck(map.get("id"));		
		return isExist > 0 ? "1" : "0";
	}
	@ResponseBody
	@PostMapping(value = "/nickNameDupleCheck", consumes = "application/json",
	produces = {MediaType.TEXT_PLAIN_VALUE})
	public String nickNameDupleCheck(@RequestBody HashMap<String, String> map) {
		log.info(">>> {}", map.get("nickName"));
		int isExist = msv.nickNameDupleCheck(map.get("nickName"));		
		return isExist > 0 ? "1" : "0";
	}
}
