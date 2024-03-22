package com.sunflower.controller;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class PaymentController {

    private final IamportClient iamportClient;

    public PaymentController() {
        this.iamportClient = new IamportClient("4431577117506150",
                "pAk2ox2tv2jGlrXt2iYNX6oVKdVWhq07LcCRIwgT7vzZiLh1IXgKYMmUjy0Ihst2x3rWZRH7qJxDwcVC");
    }

    @ResponseBody
    @RequestMapping("/verify/{imp_uid}")
    public IamportResponse<Payment> paymentByImpUid(@PathVariable("imp_uid") String imp_uid)
            throws IamportResponseException, IOException {
        return iamportClient.paymentByImpUid(imp_uid);
    }

}
