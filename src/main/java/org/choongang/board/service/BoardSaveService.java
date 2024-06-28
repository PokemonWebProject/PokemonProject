package org.choongang.board.service;

import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.choongang.board.controllers.RequestBoardSave;
import org.choongang.board.entities.Board;
import org.choongang.board.mappers.BoardMapper;
import org.choongang.board.validators.BoardValidator;
import org.choongang.global.config.annotations.Service;
import org.choongang.global.exceptions.AlertException;

@Service
@RequiredArgsConstructor
public class BoardSaveService {
    private final BoardValidator validator;
    private final BoardMapper mapper;

    public void process(RequestBoardSave form){
        validator.check(form);

        Board board = Board.builder().artTitle(form.getArtTitle())
                .userNo(form.getUserNo())
                .artBody(form.getArtBody())
                //.fileName(form.getFileName())
                .fileName(" ")
                .build();
        int result = 0;

        if(form.getArtNo() == null) {
            result = mapper.register(board);
        } else {
            board.setArtNo(Integer.parseInt(form.getArtNo()));
            result = mapper.update(board);
        }

        System.out.println(board);
        if(result < 1){
            throw new AlertException("게시글 저장을 실패하였습닉다", HttpServletResponse.SC_BAD_REQUEST);
        }

    }
}
