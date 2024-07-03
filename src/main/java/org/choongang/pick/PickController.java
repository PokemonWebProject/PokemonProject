package org.choongang.pick;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.choongang.global.config.annotations.Controller;
import org.choongang.global.config.annotations.GetMapping;
import org.choongang.global.config.annotations.PostMapping;
import org.choongang.global.config.annotations.RequestMapping;
import org.choongang.mypage.controllers.RequestMemberInfo;
import org.choongang.mypage.services.MemberInfoService;

import java.util.List;

@Controller
@RequestMapping("/pick")
@RequiredArgsConstructor
public class PickController {

    private final MemberInfoService memberInfoService;
    private final HttpServletRequest request;

    @GetMapping
    public String index() {

        request.setAttribute("addCss", List.of("mainPage/mainPage"));
        request.setAttribute("addScript", List.of("mypage/profile", "mypage/info"));

        return "pick/index";
    }

    /**
     * 회원 정보 확인 및 수정
     * @return
     */
    @PostMapping("/mypage/seal")
    public String infoPs(RequestMemberInfo form) {

        memberInfoService.update(form);

        String url = request.getContextPath() + "/mypage/seal";
        String script = String.format("parent.location.replace('%s');", url);

        request.setAttribute("script", script);

        return "commons/execute_script";
    }
}


