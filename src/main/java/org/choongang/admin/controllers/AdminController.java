package org.choongang.admin.controllers;

import org.choongang.global.config.annotations.Controller;
import org.choongang.global.config.annotations.GetMapping;
import org.choongang.global.config.annotations.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {



    @GetMapping
    public String index() {
        return "admin/index";
    }

    public String confirm() {
        return "관리자 로그인이 완료됐습니다.";
    }






    }


