package com.sunflower.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Service
public class ExchangeRateService {
	private static final String API_KEY = "RYkXsKPfBB9htk7WkwCfszOEFgFxUOUO";
	private static final String BASE_CURRENCY = "USD";
    private static final String API_URL = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=" + API_KEY + "&searchdate=20180102&data=AP01";

	public Map<String, Double> getRates() throws IOException {
	    Map<String, Double> rates = new HashMap<>();
	
	    CloseableHttpClient httpClient = HttpClients.createDefault();
	    HttpGet request = new HttpGet(API_URL);
	    CloseableHttpResponse response = httpClient.execute(request);
	
	    try {
	        HttpEntity entity = response.getEntity();
	        String responseBody = EntityUtils.toString(entity);
	
	        ObjectMapper objectMapper = new ObjectMapper();
	        JsonNode rootNode = objectMapper.readTree(responseBody);
	
	        JsonNode ratesNode = rootNode.get("rates");
		            ratesNode.fieldNames().forEachRemaining(currency -> {
		                double rate = ratesNode.get(currency).asDouble();
		                rates.put(currency, rate);
		            });
		        } finally {
		            response.close();
		            httpClient.close();
		        }
		        return rates;
	}
}
