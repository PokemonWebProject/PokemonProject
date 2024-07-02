package org.choongang.file.models;

import org.choongang.file.mappers.FileInfoMapper;
import org.choongang.global.config.annotations.Service;

import java.util.List;
@Service
public class FileInfoService {
    private FileInfoMapper fileInfoMapper;

    public FileInfoService(FileInfoMapper fileInfoMapper) {
        this.fileInfoMapper = fileInfoMapper;
    }

    public FileInfo get(long id) {

        return null;
    }

    public List<FileInfo> getList(String gid, String location) {

        return null;
    }

    public List<FileInfo> getList(String gid) {
        return getList(gid, null);
    }
}
