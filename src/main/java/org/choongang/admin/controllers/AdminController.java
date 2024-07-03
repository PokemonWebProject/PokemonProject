package org.choongang.admin.controllers;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
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




    @GetMapping("/board")
    //관리자쪽 게시판 목록
    public String board(HttpServletRequest request) {




        return "admin/board";
    }


}


