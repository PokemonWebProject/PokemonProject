package org.choongang.mypage.services;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.choongang.global.config.annotations.Service;
import org.choongang.global.config.containers.BeanContainer;
import org.choongang.member.MemberUtil;
import org.choongang.mypage.controllers.RequestMemberInfo;
import org.choongang.member.entities.Member;
import org.choongang.member.mappers.MemberMapper;
import org.choongang.mypage.validators.MemberInfoValidator;
import org.mindrot.jbcrypt.BCrypt;

@Service
@RequiredArgsConstructor
public class MemberInfoService {
    private final MemberMapper mapper;
    private final MemberInfoValidator validator;
    private final MemberUtil memberUtil;

    public void update(RequestMemberInfo form) {
        validator.check(form);

        String userName = form.getUserName();
        String password = form.getPassword();
        long myPokemonSeq = form.getMyPokemonSeq();

        Member member = memberUtil.getMember(); // 로그인한 회원 정보

        // 회원명 및 비밀번호 변경
        member.setUserName(userName);
        if (password != null && !password.isBlank()) {
            String hash = BCrypt.hashpw(password, BCrypt.gensalt(12));  // 비밀번호 해시화
            member.setPassword(hash);
        }

        member.setMyPokemonSeq(myPokemonSeq);

        // 회원 정보 수정 처리
        mapper.modify(member);

        // 세션 데이터 업데이트
        HttpSession session = BeanContainer.getInstance().getBean(HttpSession.class);
        Member _member = mapper.get(member.getEmail());
        session.setAttribute("member", _member);
    }
}
