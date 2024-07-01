package org.choongang.admin.service;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.choongang.admin.member.controllers.MemberSearch;
import org.choongang.global.ListData;
import org.choongang.global.Pagination;
import org.choongang.global.config.annotations.Service;
import org.choongang.global.config.containers.BeanContainer;
import org.choongang.member.entities.Member;
import org.choongang.member.mappers.MemberMapper;

import java.util.List;
import java.util.Optional;

//멤버리스트 출력
@Service
@RequiredArgsConstructor
public class MemberInfoService {

    private final MemberMapper mapper;

    // 회원 목록 조회
    public ListData<Member> getList(MemberSearch search) {
        int page = Math.max(search.getPage(), 1);
        int limit = search.getLimit() < 1 ? 20 : search.getLimit();
        int offset = (page - 1) * limit  + 1; //1페이지부터 조회될 수 있게
        int endRows = offset + limit;
        search.setLimit(limit);
        search.setEndRows(endRows);

        List<Member> items = mapper.getList(search);

        int total = mapper.getTotal(search);

        Pagination pagination = new Pagination(page, total, 10, limit, BeanContainer.getInstance().getBean(HttpServletRequest.class));

        return new ListData<>(items, pagination);
    }

    // 회원 개별 상세 조회
    public Optional<Member> get(String email) {

        Member member = mapper.get(email);

        return Optional.ofNullable(member);
    }

 }

