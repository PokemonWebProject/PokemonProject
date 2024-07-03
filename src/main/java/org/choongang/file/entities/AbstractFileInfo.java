package org.choongang.file.entities;

import lombok.Data;

@Data
public class AbstractFileInfo {

    private String filePath; //파일 업로드 경로
    private String fileUrl; // 파일 웹접근 주소
}
