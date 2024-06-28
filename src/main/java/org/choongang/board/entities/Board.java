package org.choongang.board.entities;

import lombok.Builder;
import lombok.Data;


import java.time.LocalDateTime;

@Data
@Builder
public class Board {
    private long artNo;
    private String artTitle;
    private long userNo;
    private String artBody;
    private String fileName;
    private long readCnt;
    private LocalDateTime regDt;
    private LocalDateTime modDt;
    private String userName;
}