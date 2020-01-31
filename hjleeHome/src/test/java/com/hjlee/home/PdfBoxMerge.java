package com.hjlee.home;

import java.io.File;
import java.io.IOException;

import org.apache.pdfbox.io.MemoryUsageSetting;
import org.apache.pdfbox.multipdf.PDFMergerUtility;
import org.apache.pdfbox.pdmodel.PDDocument;

public class PdfBoxMerge {
    public static void main(String[] args) throws IOException {
        File file1 = new File("C:\\Users\\user\\Desktop\\CRM_유지보수\\1.pdf");
        PDDocument doc1 = PDDocument.load(file1);

        File file2 = new File("C:\\Users\\user\\Desktop\\CRM_유지보수\\2.pdf");
        PDDocument doc2 = PDDocument.load(file1);

        PDFMergerUtility PDFmerger = new PDFMergerUtility();

        PDFmerger.setDestinationFileName("C:\\Users\\user\\Desktop\\CRM_유지보수\\test.pdf");

        PDFmerger.addSource(file1);
        PDFmerger.addSource(file2);

        PDFmerger.mergeDocuments(MemoryUsageSetting.setupMainMemoryOnly());

        doc1.close();
        doc2.close();
    }
}
