package org.choongang.admin.service;

import lombok.RequiredArgsConstructor;
import org.choongang.admin.member.controllers.MemberSearch;
import org.choongang.global.config.annotations.Service;
import org.choongang.member.entities.Member;
import org.choongang.member.mappers.MemberDataMapper;

/**
 * 회원 수정
 */


@RequiredArgsConstructor
@Service

public class MemberEditService {
    private MemberDataMapper mapper;
    private Member member;
    private MemberSearch search;


    public String memberEdit(Member member) {

        String Email = member.getEmail();
        String Name = member.getUserName();

       // String EditNam


        return null;

    }



}
