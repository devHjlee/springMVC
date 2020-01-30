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
    	//���ϰ��
    	String filePath ="C:\\upload\\";

    	//���ϵ��� List�������� ����
    	List<MultipartFile> files = multipartHttpServletRequest.getFiles("files");

    	File file = new File(filePath);
    	//������ ���ٸ� ���丮�� ����
    	if (file.exists() == false) {
    		file.mkdirs();
    	}

    	for (int i = 0; i < files.size(); i++) {
    		System.out.println(files.get(i).getOriginalFilename() +" ���ε�");
    		//���� ���ε� �ҽ� ���⿡ ����
    		file = new File(filePath+files.get(i).getOriginalFilename());
    		files.get(i).transferTo(file);
    	}
    	return new ResponseEntity("���ε� ���� - " + "dddd", HttpStatus.OK);
    }

}
