package com.hjlee.home.common.login.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/comm/login")
	public String login(HttpServletRequest request,Principal principal,Authentication authentication) {
		logger.info("Login Controller!");
		logger.info("getSession:"+request.getSession().toString());

		return "/login";
	}
	@RequestMapping(value = "/comm/access_denied_page")
	public String accessDenied(HttpServletRequest request,Principal principal,Authentication authentication) {
		logger.info("accessDenied!");
		logger.info("getSession:"+request.getSession().toString());

		return "/error/error403";
	}
}
