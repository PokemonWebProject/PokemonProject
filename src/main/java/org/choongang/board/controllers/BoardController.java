package org.choongang.board.controllers;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.choongang.global.config.annotations.Controller;
import org.choongang.global.config.annotations.GetMapping;
import org.choongang.global.config.annotations.PostMapping;
import org.choongang.global.config.annotations.RequestMapping;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {
    //private final BoardSaveService boardSaveService;

    //게시물 등록 양식
    @GetMapping("/boardsave")
    public String boardSave() {

        return "board/boardsave";
    }

    //게시물 등록 처리

    @PostMapping("/boardsave")
    public String boardSavePs(RequestBoardSave form, HttpServletRequest req){

        /*
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
                String filename = item.getName();
                String contentType = item.getContentType();
                long size = item.getSize(); //파일크기 byte

                File file = new File("D:/uploads/" + filename);
                item.write(file.toPath());

                form.setFileName(filename);
            }

            System.out.println(form);
            boardSaveService.process(form);
        }
         */
        return "board/boardsave";
    }

}
