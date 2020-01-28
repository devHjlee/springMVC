package com.hjlee.home.toatsui.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ToastUiTestController {
	private static final Logger logger = LoggerFactory.getLogger(ToastUiTestController.class);

	@RequestMapping(value = "/toast/grid", method = RequestMethod.GET)
	public String toastUiGrid(HttpServletRequest request) {
		logger.info("Toast Ui Grid Get");
		return "/toastui/toastUiGrid";
		//return "/board/board";
	}
}
