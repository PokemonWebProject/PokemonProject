package org.choongang.member.tests;

import com.github.javafaker.Faker;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSession;
import org.choongang.member.controllers.RequestJoin;
import org.choongang.member.services.JoinService;
import org.choongang.member.services.LoginService;
import org.choongang.member.services.MemberServiceProvider;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.mockito.junit.jupiter.MockitoSettings;
import org.mockito.quality.Strictness;

import java.util.Locale;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;
import static org.mockito.BDDMockito.given;

@ExtendWith(MockitoExtension.class)
@MockitoSettings(strictness = Strictness.LENIENT)
@DisplayName("로그인 기능 테스트")
public class LoginServiceTest {

    private LoginService loginService;
    private Faker faker;
    private RequestJoin form;
    private SqlSession dbSession;

    @Mock
    private HttpServletRequest request;

    @Mock
    private HttpSession session;

    @BeforeEach
    void init() {
        loginService = MemberServiceProvider.getInstance().loginService();
        JoinService joinService = MemberServiceProvider.getInstance().joinService();
        faker = new Faker(Locale.ENGLISH);
        dbSession = MemberServiceProvider.getInstance().getSession();

        // 회원 가입 -> 가입한 회원 정보로 email, password 스텁 생성

        form = RequestJoin.builder()
                .email(System.currentTimeMillis() + faker.internet().emailAddress())
                .password(faker.regexify("\\w{8,16}").toLowerCase())
                .userName(faker.name().fullName())
                .termsAgree(true)
                .build();
        form.setConfirmPassword(form.getPassword());

        joinService.process(form);

        setData();

        given(request.getSession()).willReturn(session);
    }

    private void setData() {
        setParam("email", form.getEmail());
        setParam("password", form.getPassword());
    }

    private void setParam(String name, String value) {
        given(request.getParameter(name)).willReturn(value);
    }

    @Test
    @DisplayName("로그인 성공시 예외가 발생하지 않음")
    void successTest() {
        assertDoesNotThrow(() -> {
           //loginService.process(request);
        });
    }

}
