package org.choongang.mypage.controllers;

import lombok.RequiredArgsConstructor;
import org.choongang.global.config.annotations.Controller;
import org.choongang.global.config.annotations.GetMapping;
import org.choongang.global.config.annotations.RequestMapping;

@Controller
@RequestMapping("/mypage")
@RequiredArgsConstructor
public class MypageController {

    // private final MypageService mypageService;

    // 마이페이지 이동
    @GetMapping("/mypage")
    public String mypage() {

        return "mypage/mypage";
    }
}