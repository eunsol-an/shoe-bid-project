package com.shoebid.www.ctrl;

import java.util.List;

import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shoebid.www.domain.QuestionVO;
import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.handler.PagingHandler;
import com.shoebid.www.service.QuestionService;

@RequestMapping("/question/*")
@Controller
public class QuestionController {
	private static Logger log = LoggerFactory.getLogger(QuestionController.class);
	
	@Inject
	private QuestionService qsv;
	
	
	@PutMapping(value = "/{qno}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> erase(@PathVariable("qno") long qno){
		return qsv.modifyIsDeleted(qno) > 0 ?
				new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PutMapping(value = "/{qno}", consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> edit(@PathVariable("qno") long qno,
			@RequestBody QuestionVO qvo){		
		return qsv.modify(qvo) > 0 ? 
				new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/{pno}/{pageNo}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<PagingHandler> spread(@PathVariable("pno") long pno,
			@PathVariable("pageNo") int pageNo){
		PagingVO pgvo = new PagingVO(pageNo, 10);
		log.info(">>> Question Controller {}", qsv.spread(pno, pgvo));
		return new ResponseEntity<PagingHandler>(qsv.spread(pno, pgvo), HttpStatus.OK);
	}
	
	@PostMapping(value = "/post", consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> post(@RequestBody QuestionVO qvo){
	log.info(">>> Question Controller {} ", qvo);
		return qsv.post(qvo) > 0 ? 
				new ResponseEntity<String>("1", HttpStatus.OK) 
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	@GetMapping(value = "/{pno}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<QuestionVO> spreadAns(@PathVariable("pno") long parent){
		log.info(">>> Answer Controller {}", qsv.getSelectAns(parent));
		return new ResponseEntity<QuestionVO>(qsv.getSelectAns(parent), HttpStatus.OK);
	}
}