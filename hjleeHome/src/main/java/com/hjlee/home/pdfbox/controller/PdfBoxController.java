package com.hjlee.home.pdfbox.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hjlee.home.pdfbox.service.PdfBoxService;

@Controller
public class PdfBoxController {
    private static final Logger logger = LoggerFactory.getLogger(PdfBoxController.class);
    @Autowired
    private Environment env;

    @Autowired
    private PdfBoxService pdfService;

    @RequestMapping(value = "/pdfbox/merge", method = RequestMethod.GET)
    public String toastUiGrid(HttpServletRequest request) {
        logger.info("PdfBoxController Get");
        logger.info("===================>" + env.getProperty("file.temp"));
        return "/dev/pdfbox/pdfBoxMerge";
    }

    @RequestMapping(value = "/pdfbox/fileUpload", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
    public ResponseEntity<String> fileUpload(MultipartHttpServletRequest multipartHttpServletRequest) throws IOException {

        List<MultipartFile> files = multipartHttpServletRequest.getFiles("files");
        String result = "";
        try {
            result = pdfService.pdfMerge(files);
        } catch (IOException e) {
            return new ResponseEntity<>("error:"+e,HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity<>("업로드 성공 - " + result, HttpStatus.OK);
    }

}
