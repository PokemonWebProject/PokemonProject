package org.choongang.board.service;

import lombok.RequiredArgsConstructor;
import org.choongang.board.entities.Board;
import org.choongang.board.mappers.BoardMapper;
import org.choongang.file.entities.FileInfo;
import org.choongang.file.services.FileInfoService;
import org.choongang.global.config.annotations.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class BoardListService {
    private final BoardMapper mapper;
    private final FileInfoService fileInfoService;

    public List<Board> process(int pageNo, int pageSize, String keyword){
        System.out.println("pageNo:" + pageNo);
        List<Board> boards = mapper.getList(pageNo, pageSize, keyword);
        System.out.println("boards.size() : " + boards.size());
        //boards.forEach(this::addBoardData);
        return boards;
    }
    public Optional<Board> get(int seq){
        Board board = mapper.get(seq);
        //addBoardData(board);
        return Optional.ofNullable(board);
    }

    private void addBoardData(Board board){
        if(board == null) {
            return;
        }

        String gid = board.getGid();
        System.out.println("board.getGid(): " + board.getGid());
        List<FileInfo> editorFiles = fileInfoService.getListDone(gid, "editor");
        List<FileInfo> attachFiles = fileInfoService.getListDone(gid, "attach");
        System.out.println(attachFiles);
        //****************
        board.setEditorFiles(editorFiles);
        board.setAttachFiles(attachFiles);

    }

}
