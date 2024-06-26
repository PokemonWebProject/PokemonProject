package org.choongang.board.controllers;

import lombok.Data;

@Data
public class RequestBoardSave {
    private String artTitle;
    private String artBody;
    private long userNo;
    private String fileName;
}
