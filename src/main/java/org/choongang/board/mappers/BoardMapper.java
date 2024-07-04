package org.choongang.board.mappers;
import org.choongang.board.entities.Board;

import java.util.List;

public interface BoardMapper {
    //int exists(int artNo);
    Board get(int artNo);
    void delete(int artNo);
    List<Board> getList(int pNo, int pSz, String keyword);
    int register(Board board);
    int update(Board board);
    int updateCnt(int artNo);
    int getCount(String keyword);
    int getMaxUserNo(); //테스트용
    int getMaxArtNo(); //테스트용
    String getGid(int artNo);
}
