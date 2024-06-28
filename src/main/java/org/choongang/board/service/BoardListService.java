package org.choongang.board.service;

import lombok.RequiredArgsConstructor;
import org.choongang.board.entities.Board;
import org.choongang.board.mappers.BoardMapper;
import org.choongang.global.config.annotations.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardListService {
    private final BoardMapper mapper;

    public List<Board> process(){

        return mapper.getList();

    }
}
