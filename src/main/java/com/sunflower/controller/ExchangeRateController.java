package com.sunflower.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Map;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sunflower.service.ExchangeRateService;

@Controller
public class ExchangeRateController {
	
	private static final Logger logger = Logger.getLogger(ExchangeRateController.class.getName());
	private final JSONParser parser = new JSONParser();
	

	@Autowired
	private ExchangeRateService exchangeRateService;

	@GetMapping("/exchange")
	public String getExchangeData(Model model) {
	
        String AuthKey = "RYkXsKPfBB9htk7WkwCfszOEFgFxUOUO";
        String SearchDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        String dataType = "AP01";
        String apiURL = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=" + AuthKey + "&searchdate=" + SearchDate + "&data=" + dataType ;

        try {
            URL oracle = new URL(apiURL);
            URLConnection yc = oracle.openConnection();
            BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream()));

            String inputLine;
            StringBuilder response = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            JSONArray jsonArray = (JSONArray) parser.parse(response.toString());

            // 데이터를 모델에 추가하여 JSP에서 사용할 수 있도록 함
            model.addAttribute("exchangeData", jsonArray);
            model.addAttribute("date", SearchDate);

        } catch (Exception e) {
            logger.error("Error fetching exchange data: " + e.getMessage());
        }

        return "/exchange/exchange-rate2"; // exchange.jsp로 이동
	}
}