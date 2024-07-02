package org.choongang.main.controllers;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.choongang.global.config.annotations.Controller;
import org.choongang.global.config.annotations.GetMapping;
import org.choongang.global.config.annotations.PostMapping;
import org.choongang.mypage.controllers.RequestProfile;
import org.choongang.mypage.services.ProfileService;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainController {

    private final ProfileService profileService;
    private final HttpServletRequest request;

    @GetMapping("/")
    public String index(HttpServletRequest request) {
        request.setAttribute("addCss", List.of("mainPage/mainPage"));
        request.setAttribute("addScript", List.of("mypage/profile", "mypage/info"));
        return "main/index";
    }

    /**
     * 회원 정보 확인 및 수정
     * @return
     */
    @PostMapping("/mypage/seal")
    public String infoPs(RequestProfile form) {

        profileService.update(form);

        String url = request.getContextPath() + "/mypage/seal";
        String script = String.format("parent.location.replace('%s');", url);

        request.setAttribute("script", script);

        return "commons/execute_script";
    }


}