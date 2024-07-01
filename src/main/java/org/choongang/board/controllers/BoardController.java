package org.choongang.board.controllers;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.choongang.board.entities.Board;
import org.choongang.board.mappers.BoardMapper;
import org.choongang.board.service.BoardListService;
import org.choongang.board.service.BoardSaveService;
import org.choongang.global.config.annotations.*;
import org.choongang.member.MemberUtil;

import java.net.URLDecoder;
import java.util.List;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {
    private final BoardSaveService boardSaveService;
    private final BoardListService boardListService;
    private final BoardMapper mapper;
    private final MemberUtil memberUtil;

    @GetMapping()
    public String index(HttpServletRequest request, @PathVariable("keyword") String keyword) {

        Board board = Board.builder().build();
        if(keyword != null) {
            keyword = URLDecoder.decode(keyword);
            board.setArtTitle("%" + keyword + "%");
        }
        List<Board> boards = boardListService.process(board);

        request.setAttribute("boards", boards);
        request.setAttribute("addCss", List.of("board"));

        return "board/index";
    }

    @GetMapping("/list/{keyword}")
    public String list(HttpServletRequest request, @PathVariable("keyword") String keyword) {

        Board board = Board.builder().build();
        if(keyword != null) {
            keyword = URLDecoder.decode(keyword);
            board.setArtTitle("%" + keyword + "%");
        }
        List<Board> boards = boardListService.process(board);

        request.setAttribute("boards", boards);
        request.setAttribute("addCss", List.of("board"));

        return "board/index";
    }



    //게시물 등록 양식
    @GetMapping("/save")
    public String saveNew(HttpSession session, HttpServletRequest request) {
        if(memberUtil.isLogin()) {
            request.setAttribute("addCss", List.of("board"));
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

        if(memberUtil.isLogin()) {
            Board board = mapper.get(num);
            request.setAttribute("board", board);
            request.setAttribute("addCss", List.of("board"));
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
            mapper.delete(num);
            return index(request, null);
        }

        String url = request.getContextPath() + "/member/login";
        String script = String.format("parent.location.replace('%s?redirectUrl=/board');", url);
        request.setAttribute("script", script);
        return "commons/execute_script";

    }

/*
    public String savePs1(RequestBoardSave form, HttpServletRequest req) throws FileUploadException, IOException {

        JakartaServletDiskFileUpload upload = new JakartaServletDiskFileUpload();
        List<DiskFileItem> items = upload.parseRequest(req);
        for (DiskFileItem item : items) {
            if (item.isFormField()) { //일반 텍스트 형태의 양식데이터
                String name = item.getFieldName();
                String value = item.getString(Charset.forName("UTF-8"));
                if(name.equals("artTitle")) {
                    form.setArtTitle(value);
                }else if(name.equals("artBody")) {
                    form.setArtBody(value);
                }else if(name.equals("userNo")) {
                    form.setUserNo(Integer.parseInt(value));
                }
            } else { //파일 데이터
                System.out.println("item.getName() =" + item.getName());
                System.out.println("item.getSize() =" + item.getSize());

                if (item.getName() != null && !item.getName().isBlank()) {
                    System.out.println("111111");
                    String contentType = item.getContentType();
                    //long size = item.getSize(); //파일크기 byte

                    File file = new File("D:/uploads/" + item.getName());
                    item.write(file.toPath());
                    form.setFileName(item.getName() );
                }else {
                    System.out.println("22222");

                    form.setFileName("");
                }

            }
            saveService.process(form);
        }

        return "board/save";
    }
*/
}