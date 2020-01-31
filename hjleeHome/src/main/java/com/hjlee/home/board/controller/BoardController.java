package com.hjlee.home.board.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardController {

    private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

    /**
     * Simply selects the home view to render by returning its name.
     */
    @RequestMapping(value = "/board/board", method = RequestMethod.GET)
    public String board(HttpServletRequest request, Principal principal, Authentication authentication) {
        logger.info("Board Controller!");
        logger.info("getSession:" + request.getSession().toString());
        logger.info("getAttributeNames:" + request.getAttributeNames());
        logger.info("principal.getName():" + principal.getName());
        logger.info("authentication.getPrincipal():" + authentication.getPrincipal());
        logger.info("authentication.getDetails().toString():" + authentication.getDetails().toString());
        logger.info("csrf:" + request.getAttribute("_csrf"));
        return "/board/board";
    }

}
