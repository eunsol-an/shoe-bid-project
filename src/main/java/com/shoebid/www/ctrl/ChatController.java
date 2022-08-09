package com.shoebid.www.ctrl;
import java.util.List;
import javax.inject.Inject;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.shoebid.www.ctrl.ChatController;
import com.shoebid.www.domain.ChatVO;
import com.shoebid.www.domain.MemberDTO;
import com.shoebid.www.domain.MemberVO;
import com.shoebid.www.service.ChatService;
import com.shoebid.www.service.MemberService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@RequestMapping("/chat/*")
@Controller
public class ChatController {
	
	@Inject
	private ChatService csv;
	
	/*
	 * @Inject private MemberService msv;
	 */
	
	
	
	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list", csv.getList());
	}
	
	
//	 @GetMapping("/list") public void list(Model model, @RequestParam("mno") long mno) { 
//		 model.addAttribute("list", csv.getList()); 
//		 MemberDTO mdto = msv.getDetail(mno); 
//		 MemberVO mvo = mdto.getMvo(); 
//		 model.addAttribute("mvo", mvo); 
//		 }
	 
	
	@GetMapping("/detail")
	public void detail(@RequestParam("cno") long room, Model model) {
		model.addAttribute("list", csv.getList());
		log.info(">>> chat detail - get");
		model.addAttribute("cvo", csv.getDetail(room)); 
		System.out.println();
	}
	
	@GetMapping(value = "/{room}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<ChatVO>> spread(@PathVariable("room") long room){
		log.info(">>> chat list - get");
		return new ResponseEntity<List<ChatVO>>(csv.spread(room), HttpStatus.OK);
	}
	
	@PostMapping(value = "/post", consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> post(@RequestBody ChatVO cvo){
		log.info(">>> chat post {}",cvo);
		return csv.post(cvo) > 0 ?
				new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}