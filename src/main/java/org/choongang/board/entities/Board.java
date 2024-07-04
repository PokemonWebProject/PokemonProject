package org.choongang.board.entities;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Board extends AbstractBoard {
    private long artNo;
    private String artTitle;
    private long userNo;
    private String userName;
    private String artBody;
    private String fileName;
    private long readCnt;
    private LocalDateTime regDt;
    private LocalDateTime modDt;
    private String gid;
}