package com.qywms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 首页Controller
 */
@Controller
public class IndexController {

    @RequestMapping("/")
    public String root() {
        return "redirect:/login.html";
    }
}
