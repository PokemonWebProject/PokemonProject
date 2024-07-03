package org.choongang.file.entities;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Builder
public class FileInfo {
    private long seq;
    private String gid;
    private String location;
    private String fileName;
    private String extension;
    private String contentType;
    private int done;
    private LocalDateTime regDt;

    private String filePath; //파일 업로드 경로
    private String fileUrl; // 파일 웹접근 주소
}
