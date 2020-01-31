package com.hjlee.home.toatsui.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ToastUiTestController {
    private static final Logger logger = LoggerFactory.getLogger(ToastUiTestController.class);

    @RequestMapping(value = "/toast/grid", method = RequestMethod.GET)
    public String toastUiGrid(HttpServletRequest request) {
        logger.info("Toast Ui Grid Get");
        request.getSession().setAttribute("test", "dlgudwo");
        return "/dev/toastui/toastUiGrid";
        // return "/board/board";
    }

    @RequestMapping(value = "/toast/grid/readData", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getJsonByMap(HttpServletRequest request, HttpServletResponse response) {

        Map<String, Object> jsonObject = new HashMap<String, Object>();
        Map<String, Object> jsonPage = new HashMap<String, Object>();
        Map<String, Object> jsonContent = new HashMap<String, Object>();
        Map<String, Object> jsonSubObject = null;
        ArrayList<Map<String, Object>> jsonList = new ArrayList<Map<String, Object>>();
        // page
        jsonPage.put("page", 1);
        jsonPage.put("totalCount", 100);
        // contents

        for (int i = 0; i < 1; i++) {
            jsonSubObject = new HashMap<String, Object>();
            jsonSubObject.put("id", i);
            for (int j = 0; j < 10; j++) {
                jsonSubObject.put("c" + j, "제목입니다." + j);
            }
            jsonList.add(jsonSubObject);
        }

        jsonContent.put("contents", jsonList);
        jsonContent.put("pagination", jsonPage);
        jsonObject.put("result", true);
        jsonObject.put("data", jsonContent);

        return jsonObject;
    }
}
