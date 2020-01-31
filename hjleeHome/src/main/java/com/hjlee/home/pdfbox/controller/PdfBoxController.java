package com.hjlee.home.pdfbox.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.pdfbox.io.MemoryUsageSetting;
import org.apache.pdfbox.multipdf.PDFMergerUtility;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hjlee.home.comm.config.EnvironmentConfig;
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
    public ResponseEntity<String> fileUpload(MultipartHttpServletRequest multipartHttpServletRequest)
            throws IOException {

        List<MultipartFile> files = multipartHttpServletRequest.getFiles("files");
        String result = pdfService.pdfMerge(files);
        // ���ϰ��
        /*
         * String filePath ="C:\\upload\\"; PDDocument pdfDoc = null; PDFMergerUtility
         * PDFmerger = new PDFMergerUtility();
         * PDFmerger.setDestinationFileName("C:\\upload\\merge\\test.pdf"); //���ϵ���
         * List�������� ����
         * 
         * 
         * File file = new File(filePath); //������ ���ٸ� ���丮�� ���� if (file.exists() ==
         * false) { file.mkdirs(); }
         * 
         * for(MultipartFile i:files) { System.out.println(i.getOriginalFilename()
         * +" ���ε�"); //���� ���ε� �ҽ� ���⿡ ���� file = new
         * File(filePath+i.getOriginalFilename()); i.transferTo(file); pdfDoc =
         * PDDocument.load(file); PDFmerger.addSource(file); pdfDoc.close();
         * file.delete(); }
         * 
         * PDFmerger.mergeDocuments(MemoryUsageSetting.setupMainMemoryOnly());
         */
        return new ResponseEntity("���ε� ���� - " + result, HttpStatus.OK);
    }

}
