package org.choongang.mypage.controllers;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.choongang.global.config.annotations.Controller;
import org.choongang.global.config.annotations.GetMapping;
import org.choongang.global.config.annotations.PostMapping;
import org.choongang.global.config.annotations.RequestMapping;
import org.choongang.mypage.services.ProfileService;

import java.util.List;

@Controller
@RequestMapping("/mypage")
@RequiredArgsConstructor
public class MypageController {

    private final ProfileService profileService;
    private final HttpServletRequest request;

    /**
     * 마이페이지 메인
     *
     * @return
     */
    @GetMapping
    public String index() {

        request.setAttribute("addScript", List.of("mypage/profile"));

        return "mypage/index";
    }

    /**
     * 회원 정보 확인 및 수정
     *
     * @return
     */
    @GetMapping("/info")
    public String info() {

        return "mypage/info";
    }

    /**
     * 회원 정보 확인 및 수정
     * @return
     */
    @PostMapping("/info")
    public String infoPs(RequestProfile form) {

        profileService.update(form);

        String url = request.getContextPath() + "/mypage";
        String script = String.format("parent.location.replace('%s');", url); // 회원정보 수정 후 페이지 새로고침

        request.setAttribute("script", script);

        return "commons/execute_script";
    }

    /**
     * 나의 띠부씰
     *
     * @return
     */
    @GetMapping("/seal")
    public String seal() {

        return "mypage/seal";
    }

}