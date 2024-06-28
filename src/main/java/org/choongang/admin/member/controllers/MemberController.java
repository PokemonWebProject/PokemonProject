package org.choongang.admin.member.controllers;

import org.choongang.global.config.annotations.Controller;
import org.choongang.global.config.annotations.GetMapping;
import org.choongang.global.config.annotations.RequestMapping;

@Controller
@RequestMapping("/admin/member")
public class MemberController {

    @GetMapping("/list")
    public String index() {

        return "admin/member/list";
    }
}
