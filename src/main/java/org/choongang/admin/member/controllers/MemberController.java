package org.choongang.admin.member.controllers;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.choongang.admin.member.services.MemberListProcessService;
import org.choongang.admin.service.MemberInfoService;
import org.choongang.global.ListData;
import org.choongang.global.config.annotations.*;
import org.choongang.member.entities.Member;


@Controller
@RequestMapping("/admin/member")
@RequiredArgsConstructor
public class MemberController {

    private final MemberInfoService infoService;
    private final MemberListProcessService listProcessService;

    @GetMapping("/list")
    public String index(MemberSearch search, HttpServletRequest request) {

        ListData<Member> data = infoService.getList(search);
        request.setAttribute("items", data.getItems());
        request.setAttribute("pagination", data.getPagination());
        //request.setAttribute("addCss", List.of("admin/list"));

        return "admin/member/list";
    }


    @PostMapping("/process")
    public String process(@RequestParam("mode") String mode, HttpServletRequest request) {

        listProcessService.process(mode);

        String script = "parent.location.reload();";
        request.setAttribute("script", script);
        return "commons/execute_script";

    }
}
