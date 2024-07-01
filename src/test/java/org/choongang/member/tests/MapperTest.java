package org.choongang.member.tests;

import org.choongang.admin.member.controllers.MemberSearch;
import org.choongang.global.config.DBConn;
import org.choongang.member.entities.Member;
import org.choongang.member.mappers.MemberMapper;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;

public class MapperTest {

    private MemberMapper mapper;

    @BeforeEach
    void init() {
        mapper = DBConn.getSession().getMapper(MemberMapper.class);
    }

    @Test
    void test1() {
        MemberSearch search = new MemberSearch();
        int page = 1;
        int limit = 20;
        int offset = (page - 1) * limit + 1;
        int endRows = offset + limit;

        search.setOffset(offset);
        search.setEndRows(endRows);
       //search.setSkey("관리");
        //search.setEmail("user");
        search.setUserName("user");
        List<Member> items = mapper.getList(search);
        items.forEach(System.out::println);

    }
}
