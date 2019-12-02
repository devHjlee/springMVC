package com.hjlee.home.admin.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hjlee.home.security.vo.CustomUserDetails;

@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping(value = "/admin/admin", method = RequestMethod.GET)
	public String admin(HttpServletRequest request,Principal principal,Authentication authentication) {
		logger.info("AdminController!");
		logger.info("getSession:"+request.getSession().toString());
		logger.info("getAttributeNames:"+request.getAttributeNames());
		logger.info("principal.getName():"+principal.getName());
		logger.info("authentication.getPrincipal():"+authentication.getPrincipal());
		logger.info("authentication.getDetails().toString():"+authentication.getDetails().toString());
		logger.info("csrf:"+request.getAttribute("_csrf"));
		String actualToken = request.getHeader("X-CSRF-TOKEN");
		CsrfToken csrfToken = (CsrfToken) request.getAttribute("_csrf");
		logger.info("actualToken:"+actualToken);
		logger.info("csrfToken:"+csrfToken.getToken());
		logger.info("asdasd:"+authentication.getPrincipal().toString());
		
		CustomUserDetails vo = (CustomUserDetails) authentication.getPrincipal();
		//logger.info("aaa"+vo.toString());
		return "/admin/admin";
	}
	
}
