package org.choongang.board.mappers;
import org.choongang.board.entities.Board;

public interface BoardMapper {
    int exists(int artNo);
    Board get(int artNo);
    int register(Board board);
}
