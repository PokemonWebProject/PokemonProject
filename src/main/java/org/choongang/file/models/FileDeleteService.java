package org.choongang.file.models;

import jakarta.servlet.http.HttpServletRequest;
import org.choongang.file.mappers.FileInfoMapper;
import org.choongang.global.config.annotations.Service;

@Service
public class FileDeleteService {
    private FileInfoMapper fileInfoMapper;

    public FileDeleteService(FileInfoMapper fileInfoMapper) {
        this.fileInfoMapper = fileInfoMapper;
    }

    public void delete(long id, HttpServletRequest req) {

    }

    public void delete(String gid, String location, HttpServletRequest req) {

    }

    public void delete(String gid, HttpServletRequest req) {
        delete(gid, null, req);
    }
}