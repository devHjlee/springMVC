package com.hjlee.home.pdfbox.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.pdfbox.io.MemoryUsageSetting;
import org.apache.pdfbox.multipdf.PDFMergerUtility;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class PdfBoxService {

    @Autowired
    private Environment env;
    private static final Logger logger = LoggerFactory.getLogger(PdfBoxService.class);

    public String pdfMerge(List<MultipartFile> files) throws IOException {
        logger.info("pdfMerge Start!");
        String filePath = env.getProperty("file.tempPath");

        PDDocument pdfDoc = null;
        PDFMergerUtility PDFmerger = new PDFMergerUtility();
        PDFmerger.setDestinationFileName(env.getProperty("file.pdfMergePath") + "/test.pdf");

        File file = new File(filePath);
        // 파일이 없다면 디렉토리를 생성
        if (file.exists() == false) {
            file.mkdirs();
        }

        for (MultipartFile i : files) {
            // 파일 업로드 소스 여기에 삽입
            try {
            file = new File(filePath + i.getOriginalFilename());
            i.transferTo(file);
            pdfDoc = PDDocument.load(file);
            PDFmerger.addSource(file);
            pdfDoc.close();
            } catch (IOException e) {
                throw new IOException(e.getMessage());
            }
        }

        PDFmerger.mergeDocuments(MemoryUsageSetting.setupMainMemoryOnly());

        return "success";
    }
}
