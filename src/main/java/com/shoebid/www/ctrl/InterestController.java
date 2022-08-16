package com.shoebid.www.ctrl;

import javax.inject.Inject;


import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shoebid.www.domain.InterestVO;
import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.handler.PagingHandler;
import com.shoebid.www.service.InterestService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/interest/*")
@Controller
public class InterestController {

	@Inject
	private InterestService itsv;
	
	@PostMapping(value = "/register", consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> register(@RequestBody InterestVO itvo){
		log.info(">>> interest register {}",itvo);
		return itsv.register(itvo) > 0 ?
				new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping("/list/{mno}")
	public String list(Model model, PagingVO pgvo, @PathVariable("mno") long mno) {
		model.addAttribute("list", itsv.getList(mno, pgvo));
		int totalCount = itsv.getTotalCount(mno);
		model.addAttribute("pgn", new PagingHandler(pgvo, totalCount));
		return "/interest/list";
	}
	@DeleteMapping(value = "/remove", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@RequestBody InterestVO itvo){
		return itsv.remove(itvo) > 0 ?
				new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
