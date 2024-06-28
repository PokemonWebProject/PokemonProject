package org.choongang.admin.service;

import lombok.RequiredArgsConstructor;
import org.choongang.global.config.annotations.Service;
import org.choongang.member.entities.Member;
import org.choongang.member.mappers.MemberMapper;

//멤버리스트 부분 출력
@Service
@RequiredArgsConstructor
public class MemberList {

    private final Member member;
    private final MemberMapper mapper;

    public void process() {


    }
 }

