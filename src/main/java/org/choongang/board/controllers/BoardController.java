package org.choongang.board.controllers;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.choongang.board.entities.Board;
import org.choongang.board.mappers.BoardMapper;
import org.choongang.board.service.BoardListService;
import org.choongang.board.service.BoardSaveService;
import org.choongang.file.services.FileDeleteService;
import org.choongang.global.config.annotations.*;
import org.choongang.global.exceptions.AlertBackException;
import org.choongang.member.MemberUtil;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {
    private final BoardSaveService boardSaveService;
    private final BoardListService boardListService;
    private final BoardMapper mapper;
    private final MemberUtil memberUtil;
    private final FileDeleteService fileDeleteService;

    @GetMapping()
    public String index(HttpServletRequest request) {
        System.out.println("index()");

        return list(request, 1, null);
    }

    @GetMapping("/list")
    public String list(HttpServletRequest request, @RequestParam("page") int pageNo) {

        System.out.println("/list - 1  request.getQueryString();" + request.getQueryString());
        return list(request, pageNo, null );
    }


    @GetMapping("/list/{keyword}")
    public String list(HttpServletRequest request, @RequestParam("page") int pageNo, @PathVariable("keyword") String keyword) {
        System.out.println("/list------2");

        System.out.println("pageNo :" + pageNo);
        if(pageNo == 0) pageNo = 1;
        System.out.println("pageNo :" + pageNo);

        Board board = Board.builder().build();
        if(keyword != null) {
            keyword = URLDecoder.decode(keyword);
        }
        int totCount = mapper.getCount(keyword);
        int maxPage = (totCount / 10) + 1;

        List<Board> boards = boardListService.process(pageNo, 10, keyword);
        request.setAttribute("boards", boards);
        request.setAttribute("keyword", keyword);
        request.setAttribute("addCss", List.of("board"));
        request.setAttribute("currentPage", pageNo);
        request.setAttribute("maxPage", maxPage);

        return "board/index";
    }
    @GetMapping("/view/{num}")
    public String view(HttpServletRequest request, @PathVariable("num") int num) {

        Board board = boardListService.get(num).orElseThrow(() -> new AlertBackException("게시글을 찾을 수 없습니다.", HttpServletResponse.SC_NOT_FOUND));

        int result = mapper.updateCnt(num);

        request.setAttribute("board", board);
        System.out.println(board);
        request.setAttribute("addCss", List.of("board"));
        return "board/view";
    }


    //게시물 등록 양식
    @GetMapping("/save")
    public String saveNew(HttpSession session, HttpServletRequest request) {
        if(memberUtil.isLogin()) {
            List<String> addCss = new ArrayList<>();
            List<String> addScript = new ArrayList<>();

            addCss.add("board");
            addCss.add("board/form");

            //본문에디터용
            addScript.add("ckeditor5/ckeditor");
            addScript.add("fileManager");
            addScript.add("board/form");

            //파일첨부용
            //addScript.add("fileUpload");

            request.setAttribute("addCss", addCss);
            request.setAttribute("addScript", addScript);

            request.setAttribute("gid", UUID.randomUUID().toString());

            return "board/save";
        }

        String url = request.getContextPath() + "/member/login";
        String script = String.format("parent.location.replace('%s?redirectUrl=/board/save');", url);
        request.setAttribute("script", script);
        return "commons/execute_script";
    }
    //게시물 수정 양식
    @GetMapping("/save/{num}")
    public String update(HttpServletRequest request, @PathVariable("num") int num) {

        List<String> addCss = new ArrayList<>();
        List<String> addScript = new ArrayList<>();
        addCss.add("board/style"); // 게시판의 공통 스타일

        if(memberUtil.isLogin()) {
            Board board = mapper.get(num);
            request.setAttribute("board", board);
            System.out.println("board.getGid() : " + board.getGid());
            if(board.getGid() == null || board.getGid().equals("")) {
                request.setAttribute("gid", UUID.randomUUID().toString());
            }

            addCss.add("board");
            addCss.add("board/form");

            addScript.add("ckeditor5/ckeditor");
            addScript.add("fileManager");  // 위치 주의
            addScript.add("board/form");

            request.setAttribute("addCss", addCss);
            request.setAttribute("addScript", addScript);

            return "board/save";
        }
        String url = request.getContextPath() + "/member/login";
        String script = String.format("parent.location.replace('%s?redirectUrl=/board/save/%d');", url,num );
        request.setAttribute("script", script);
        return "commons/execute_script";
    }

    //게시물 등록, 수정 처리
    @PostMapping("/save")
    public String savePs(RequestBoardSave form, HttpServletRequest request) {

        boardSaveService.process(form);

        String url = request.getContextPath() + "/board";
        String script = String.format("parent.location.replace('%s');", url);

        request.setAttribute("script", script);

        return "commons/execute_script";
        //return "board/save";
    }
    //게시물 삭제 처리
    @GetMapping("/delete/{num}")
    public String deletePs(HttpServletRequest request, @PathVariable("num") int num) {

        if(memberUtil.isLogin()) {

            // num으로 gid 가져와서 파일도 삭제하기
            String gid = mapper.getGid(num);
            mapper.delete(num);
            fileDeleteService.deletes(gid);

            return index(request);
        }

        String url = request.getContextPath() + "/member/login";
        String script = String.format("parent.location.replace('%s?redirectUrl=/board');", url);
        request.setAttribute("script", script);
        return "commons/execute_script";

    }
}