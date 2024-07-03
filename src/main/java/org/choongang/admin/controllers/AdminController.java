package org.choongang.admin.controllers;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.choongang.board.controllers.BoardController;
import org.choongang.global.config.annotations.Controller;
import org.choongang.global.config.annotations.GetMapping;
import org.choongang.global.config.annotations.RequestMapping;

import java.util.List;

@RequiredArgsConstructor
@Controller
@RequestMapping("/admin")
public class AdminController {
    private final BoardController boardController;

    @GetMapping
    public String index() {
        return "admin/index";
    }


    @GetMapping("/board")
    //관리자쪽 게시판 목록이동
    public String board(HttpServletRequest request) {

       // request.setAttribute("addCss", List.of("admin"));
        boardController.index(request);

        return "board/index_admin";
    }


}


