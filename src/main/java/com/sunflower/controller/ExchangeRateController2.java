package com.sunflower.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunflower.service.ExchangeRateService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class ExchangeRateController2 {
	
	private static final Logger logger = Logger.getLogger(ExchangeRateController2.class.getName());
	private final JSONParser parser = new JSONParser();
	

	@Autowired
	private ExchangeRateService exchangeRateService;
	 
	@ResponseBody
	@PostMapping("/exchange")
	    public Double getExchangeData(@RequestBody String unit,  Model model) {
	    
	        String AuthKey = "RYkXsKPfBB9htk7WkwCfszOEFgFxUOUO";
	        String SearchDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
	        String dataType = "AP01";
	        String apiURL = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=" + AuthKey + "&searchdate=" + SearchDate + "&data=" + dataType ;
	        
	        JSONArray jsonArray = new JSONArray();
	        
	        ArrayList<String> slist = new ArrayList<>();
	        ArrayList<Double> dlist = new ArrayList<>();
	        
	        double exc = 0;
	        
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
	            
	            jsonArray = new JSONArray(response.toString()); // 이 부분 수정
	            
	            // 데이터를 모델에 추가하여 JSP에서 사용할 수 있도록 함
	            model.addAttribute("exchangeData", jsonArray);
	            model.addAttribute("date", SearchDate);

				/* log.info(jsonArray); */
	            //---------------------------------------------------------------
	            for (int i = 0; i < jsonArray.length(); i++) {
	                JSONObject jsonObject = jsonArray.getJSONObject(i);
	                
	                // 이름과 나이 추출
	                String key = jsonObject.getString("deal_bas_r");
	                slist.add(key);
	                
	                double num = Double.parseDouble(key.replaceAll(",", "").trim());
	                dlist.add(num);	
	            }    
	            
	             if(unit.equals("unit=yen") || unit == "unit=yen" ) {   exc = dlist.get(12);	exc = 100 / exc;}
	             if(unit.equals("unit=usd") || unit == "unit=usd")  {   exc = dlist.get(22);    exc = 1 / exc;}
	        } catch (Exception e) {
	            logger.error("Error fetching exchange data: " + e.getMessage());
	        }
	        finally {
	        	model.addAttribute("exc", exc);
	        }
	        log.info(exc);
	        return exc ; 
	    }
	
	@GetMapping("/header")
	public String header(Model model) {
		 
		ArrayList<Double> chlist = new ArrayList<>(Arrays.asList(1000.0, 2000.0, 3000.0, 4000.0, 5000.0));
		double check = 1000;
		model.addAttribute("chlist", chlist);
	    model.addAttribute("check", check);
		return "/header"; // exchange.jsp로 이동
	}
	
}