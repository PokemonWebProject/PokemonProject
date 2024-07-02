package org.choongang.member.services;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.choongang.global.config.annotations.Service;
import org.choongang.global.config.containers.BeanContainer;
import org.choongang.member.controllers.RequestLogin;
import org.choongang.member.entities.Member;
import org.choongang.member.mappers.MemberMapper;
import org.choongang.member.validators.LoginValidator;

@Service
@RequiredArgsConstructor
public class LoginService {

    private final LoginValidator loginValidator;
    private final MemberMapper mapper;

    public void process(RequestLogin form) {
        loginValidator.check(form);

        // 회원 정보 조회
        Member member = mapper.get(form.getEmail());

        // 세션에 회원 정보 유지
        HttpSession session = BeanContainer.getInstance().getBean(HttpSession.class);
        session.setAttribute("member", member);

        //출석한 사람 기록하기 위해선 여기에다가 뭘 만들어야됨!
    }
}