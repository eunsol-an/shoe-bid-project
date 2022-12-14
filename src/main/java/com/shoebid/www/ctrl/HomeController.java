package com.shoebid.www.ctrl;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shoebid.www.domain.PagingVO;
import com.shoebid.www.domain.ProductPagingVO;
import com.shoebid.www.handler.PagingHandler;
import com.shoebid.www.service.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private ProductService psv;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, ProductPagingVO ppgvo) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		model.addAttribute("list", psv.getList(ppgvo));
		ppgvo.setOrderBy("end");
		model.addAttribute("endList", psv.getList(ppgvo));
		
		return "home";
	}
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about() {
		return "about";
	}
	
}
