package org.choongang.admin.service;

import lombok.RequiredArgsConstructor;
import org.choongang.global.config.annotations.GetMapping;
import org.choongang.global.config.annotations.Service;
import org.choongang.member.entities.Member;
import org.choongang.member.mappers.MemberDataMapper;

/**
 * 회원 수정
 */


@RequiredArgsConstructor
@Service

public class MemberSaveService {
    private MemberDataMapper mapper;

    public String memberAlter(Member member) {


        return null;

    }



}
