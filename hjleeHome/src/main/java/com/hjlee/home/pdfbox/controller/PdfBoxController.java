package com.hjlee.home.pdfbox.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class PdfBoxController {
	private static final Logger logger = LoggerFactory.getLogger(PdfBoxController.class);

	@RequestMapping(value = "/pdfbox/merge", method = RequestMethod.GET)
	public String toastUiGrid(HttpServletRequest request) {
		logger.info("PdfBoxController Get");
		return "/dev/pdfbox/pdfBoxMerge";
	}

    @RequestMapping(value = "/pdfbox/fileUpload", method = RequestMethod.POST, produces="text/plain;charset=utf-8")
    public ResponseEntity<String> fileUpload(MultipartHttpServletRequest multipartHttpServletRequest) throws IOException {
    	//파일경로
    	String filePath ="C:\\upload\\";

    	//파일들을 List형식으로 보관
    	List<MultipartFile> files = multipartHttpServletRequest.getFiles("files");

    	File file = new File(filePath);
    	//파일이 없다면 디렉토리를 생성
    	if (file.exists() == false) {
    		file.mkdirs();
    	}

    	for (int i = 0; i < files.size(); i++) {
    		System.out.println(files.get(i).getOriginalFilename() +" 업로드");
    		//파일 업로드 소스 여기에 삽입
    		file = new File(filePath+files.get(i).getOriginalFilename());
    		files.get(i).transferTo(file);
    	}
    	return new ResponseEntity("업로드 성공 - " + "dddd", HttpStatus.OK);
    }

}
