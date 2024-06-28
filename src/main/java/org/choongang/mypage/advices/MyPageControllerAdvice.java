package org.choongang.mypage.advices;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.choongang.global.Interceptor;
import org.choongang.global.config.annotations.ControllerAdvice;
import org.choongang.member.MemberUtil;

import java.io.IOException;

@RequiredArgsConstructor
@ControllerAdvice("org.choongang.mypage")
public class MyPageControllerAdvice implements Interceptor {
    private final MemberUtil memberUtil;
    private final HttpServletResponse response;
    private final HttpServletRequest request;

    @Override
    public boolean preHandle() {
        // 미로그인시 마이페이지 접근 통제(로그인 후 마이페이지로 이동)
        if (!memberUtil.isLogin()) {
            try {
                response.sendRedirect(request.getContextPath() + "/member/login?redirectUrl=/mypage");
            } catch (IOException e) {}
            return false;
        }
        return true;
    }
}
