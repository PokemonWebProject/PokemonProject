package org.choongang.board.controllers;

import lombok.Data;
import org.choongang.file.entities.FileInfo;

import java.util.List;

@Data
public class RequestBoardSave {
    private String artNo;
    private String artTitle;
    private String artBody;
    private long userNo;
    private String fileName;
    private String gid ;

    private List<FileInfo> editorFiles;
    private List<FileInfo> attachFiles;
}
