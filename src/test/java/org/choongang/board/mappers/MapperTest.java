package org.choongang.board.mappers;

import org.choongang.board.entities.Board;
import org.choongang.global.config.DBConn;
import org.junit.jupiter.api.Test;

public class MapperTest {

    @Test
    void test1() {
        BoardMapper mapper = DBConn.getSession().getMapper(BoardMapper.class);

        Board board = mapper.get(83);
        System.out.println(board);

    }
}
