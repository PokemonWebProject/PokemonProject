package org.choongang.board.mappers;
import org.choongang.board.entities.Board;

import java.util.List;

public interface BoardMapper {
    //int exists(int artNo);
    Board get(int artNo);
    void delete(int artNo);
    List<Board> getList(Board board);
    int register(Board board);
    int update(Board board);
}
