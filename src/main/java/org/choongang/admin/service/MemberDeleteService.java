package org.choongang.admin.service;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.choongang.global.config.annotations.DeleteMapping;
import org.choongang.global.config.annotations.Service;
import org.choongang.member.entities.Member;
import org.choongang.member.mappers.MemberMapper;

import java.lang.annotation.Target;

@RequiredArgsConstructor
@Service
@DeleteMapping("/delete")
public class MemberDeleteService {
    private Member member;
    private MemberMapper mapper;

    public String deleteMember(HttpServletRequest request, Member member) {




        return deleteMember();
    }

}
