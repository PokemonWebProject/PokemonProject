package org.choongang.file.services;


import lombok.RequiredArgsConstructor;
import org.choongang.file.entities.FileInfo;
import org.choongang.file.exceptions.FileNotFoundException;
import org.choongang.file.mappers.FileInfoMapper;
import org.choongang.global.config.annotations.Service;

import java.io.File;
import java.util.List;

@Service
@RequiredArgsConstructor
public class FileDeleteService {
    private final FileInfoMapper mapper;
    private final FileInfoService infoService;

    //파일 1개 삭제
    public void delete(long seq) {
        FileInfo data = infoService.get(seq).orElseThrow(FileNotFoundException::new);
        String filePath = data.getFilePath();
        File file = new File(filePath);
        if (file.exists()) {
            file.delete();
        }
        mapper.delete(seq);
    }

    public void delete(FileInfo data) {
        String filePath = data.getFilePath();
        File file = new File(filePath);
        if (file.exists()) {
            file.delete();
        }
        mapper.delete(data.getSeq());
    }

    public void deletes(String gid, String location) {
        List<FileInfo> items = infoService.getList(gid, location);
        items.forEach(this::delete);
    }

    public void deletes(String gid) {
        deletes(gid, null);
    }

}
