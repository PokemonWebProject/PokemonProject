package org.choongang.member.mappers;

import org.choongang.member.entities.Member;

public interface MemberDataMapper {
    Member get(String email);
    int exists(String email);
    int register(Member member);
    int modify(Member member);
    int delete(String email);

}
