package com.hjlee.home.security.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@RequestMapping(value = "/emailChk", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> userEmailCheck(@RequestBody CustomUserDetails user,HttpServletRequest request) throws Exception{
		String actualToken = request.getHeader("X-CSRF-TOKEN");
		CsrfToken csrfToken = (CsrfToken) request.getAttribute("_csrf");
		logger.info("actualToken:"+actualToken);
		logger.info("csrfToken:"+csrfToken.getToken());
		int result = userService.getUserByEmail(user.getEmail());
		String resultMsg = "success";
		if(result > 0) {
			resultMsg = "fail";
		}
		Map<String, Object> map = new HashMap<>();
		map.put("result", resultMsg);
	    return map;
	}

	@RequestMapping(value = "/register", method=RequestMethod.POST, produces="application/x-www-form-urlencoded;charset=UTF-8")
	public String userRegister(CustomUserDetails user) throws Exception{

		int result = userService.insertUserInfo(user);
		logger.info("register Result:"+result);

		return "redirect:/login";
	}
}