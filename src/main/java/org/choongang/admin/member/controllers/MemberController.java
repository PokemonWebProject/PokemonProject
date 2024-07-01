package org.choongang.admin.member.controllers;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.choongang.admin.service.MemberInfoService;
import org.choongang.global.ListData;
import org.choongang.global.config.annotations.Controller;
import org.choongang.global.config.annotations.GetMapping;
import org.choongang.global.config.annotations.RequestMapping;
import org.choongang.member.entities.Member;

@Controller
@RequestMapping("/admin/member")
@RequiredArgsConstructor
public class MemberController {

    private final MemberInfoService infoService;

    @GetMapping("/list")
    public String index(MemberSearch search, HttpServletRequest request) {

        ListData<Member> data = infoService.getList(search);
        request.setAttribute("items", data.getItems());
        request.setAttribute("pagination", data.getPagination());

        return "admin/member/list";
    }
}
