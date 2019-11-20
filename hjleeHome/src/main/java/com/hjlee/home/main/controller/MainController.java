package com.hjlee.home.main.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);
		logger.info("getSession:"+request.getSession());
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		return "main";
	}

	@RequestMapping(value = "/login")
	public String login(HttpServletRequest request,Principal principal,Authentication authentication) {
		logger.info("Login Controller!");
		logger.info("getSession:"+request.getSession().toString());

		return "/login";
	}

	@RequestMapping(value = "/access_denied_page")
	public String accessDenied(HttpServletRequest request,Principal principal,Authentication authentication) {
		logger.info("accessDenied!");
		logger.info("getSession:"+request.getSession().toString());

		return "/error/error403";
	}

	@RequestMapping(value = "/register")
	public String register(HttpServletRequest request,Principal principal,Authentication authentication) {
		logger.info("accessDenied!");
		logger.info("getSession:"+request.getSession().toString());

		return "/register";
	}
}