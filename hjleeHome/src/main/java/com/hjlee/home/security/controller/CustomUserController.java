package com.hjlee.home.security.controller;

import java.security.Principal;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hjlee.home.security.service.CustomUserDetailsService;
import com.hjlee.home.security.vo.CustomUserDetails;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CustomUserController {

	@Autowired
	private CustomUserDetailsService userService;

	private static final Logger logger = LoggerFactory.getLogger(CustomUserController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpServletRequest request,Authentication authentication) {
		logger.info("Welcome home!");
		logger.info("csrf:"+request.getAttribute("_csrf"));
		return "main";
	}

	@RequestMapping(value = "/login")
	public String login(HttpServletRequest request,Principal principal,Authentication authentication) {
		logger.info("Login Page!");

		return "/login";
	}

	@RequestMapping(value = "/access_denied_page")
	public String accessDenied(HttpServletRequest request,Principal principal,Authentication authentication) {
		logger.info("accessDenied!");

		return "/error/error403";
	}

	@RequestMapping(value = "/register", method=RequestMethod.GET)
	public String register(HttpServletRequest request,Principal principal,Authentication authentication) {
		logger.info("register!");

		return "/register";
	}

	@RequestMapping(value = "/register", method=RequestMethod.POST)
	public String joinUser(CustomUserDetails user) throws Exception{

		userService.joinUser(user);

		return "redirect:/login";
	}
}