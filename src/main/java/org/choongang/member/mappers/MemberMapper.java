package org.choongang.member.mappers;

import org.choongang.admin.member.controllers.MemberSearch;
import org.choongang.member.entities.Member;

import java.util.List;

public interface MemberMapper {
    Member get(String email);
    int exists(String email);
    int register(Member member);
    int modify(Member member);
    List<Member> getList(MemberSearch search);
    int getTotal(MemberSearch search);
    int delete(String email);
}
