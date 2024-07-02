package org.choongang.board;

import org.choongang.board.entities.Board;
import org.choongang.board.mappers.BoardMapper;
import org.choongang.global.config.DBConn;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class BoardTest {
    private BoardMapper mapper;

    @BeforeEach
    void init() {
        mapper = DBConn.getSession().getMapper(BoardMapper.class);
    }
    @Test
    @DisplayName("BoardMapper get Test")
    void getTest() {
        int testArtNo = mapper.getMaxArtNo();
        Board board = mapper.get(testArtNo);

        assertNotNull(board);

    }

    @Test
    @DisplayName("BoardMapper register & update Test")
    void registerUpdateTest() {

        int testUserNo = mapper.getMaxUserNo();
        Board board = Board.builder()
                .artTitle("테스트 게시물")
                .artBody("테스트게시물 본문본문")
                .userNo(testUserNo)
                .build();

        assertDoesNotThrow(() ->  mapper.register(board));

        Board board2 = Board.builder()
                .artNo(board.getArtNo())
                .artTitle("테스트게시물(수정)")
                .artBody("테스트게시물본문(수정수정)")
                .userNo(testUserNo)
                .build();

        assertDoesNotThrow(() -> mapper.update(board2));

        Board board3 = mapper.get((int)board.getArtNo());

        assertEquals(board2.getArtTitle(), board3.getArtTitle());

    }

}
