package org.choongang.board.controllers;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.apache.commons.fileupload2.core.DiskFileItem;
import org.apache.commons.fileupload2.core.FileUploadException;
import org.apache.commons.fileupload2.jakarta.servlet6.JakartaServletDiskFileUpload;
import org.choongang.board.service.BoardSaveService;
import org.choongang.global.config.annotations.Controller;
import org.choongang.global.config.annotations.GetMapping;
import org.choongang.global.config.annotations.PostMapping;
import org.choongang.global.config.annotations.RequestMapping;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.List;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {
    private final BoardSaveService boardSaveService;

    @GetMapping
    public String index() {

        return "board/index";
    }

    //게시물 등록 양식
    @GetMapping("/boardsave")
    public String boardSave() {

        return "board/boardsave";
    }

    //게시물 등록 처리
    @PostMapping("/boardsave")
    public String boardSavePs(RequestBoardSave form, HttpServletRequest request) {
        boardSaveService.process(form);

        String url = request.getContextPath() + "/board/index";
        String script = String.format("parent.location.replace('%s');", url);

        request.setAttribute("script", script);

        return "commons/execute_script";
        //return "board/boardsave";
    }




    public String boardSavePs1(RequestBoardSave form, HttpServletRequest req) throws FileUploadException, IOException {

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
            boardSaveService.process(form);
        }

        return "board/boardsave";
    }

}