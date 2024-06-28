package org.choongang.admin.controllers;

import jakarta.servlet.http.HttpServletRequest;
import org.choongang.global.config.annotations.Controller;
import org.choongang.global.config.annotations.GetMapping;
import org.choongang.member.entities.Member;


@Controller
public class MemberListcontroller {


    //주소를 입력하면 멤버리스트 주소로 연결
@GetMapping("/memberlist")
    public void memberlist(HttpServletRequest request) {

    String listurl = request.getContextPath() + "admin/memberlist";



}



}
