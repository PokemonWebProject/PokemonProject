package org.choongang.mypage.controllers;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.choongang.global.config.annotations.Controller;
import org.choongang.global.config.annotations.GetMapping;
import org.choongang.global.config.annotations.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/mypage")
@RequiredArgsConstructor
public class MypageController {

    // private final MypageService mypageService;

    @GetMapping("/mypage")
    public String mypage(HttpServletRequest request) {

        request.setAttribute("addCss", List.of("mypage"));
        return "mypage/mypage";
    }
}