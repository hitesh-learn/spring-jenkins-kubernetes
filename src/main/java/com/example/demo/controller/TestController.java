package com.example.demo.controller;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RestController

public class TestController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String get() {
        return "Initial Base API Test";
    }

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public String test() {
        return "Testing CI /CD commit 2";
    }
}