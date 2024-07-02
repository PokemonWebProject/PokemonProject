package org.choongang.file.mappers;

import org.choongang.file.models.FileInfo;

import java.util.List;

public interface FileInfoMapper {
    public boolean add(FileInfo fileInfo) ;
    public FileInfo get(long id);
    public List<FileInfo> getList(String gid, String location) ;
    public List<FileInfo> getList(String gid);
    public boolean delete(long id) ;
    public boolean delete(String gid, String location) ;
    public boolean delete(String gid);
}
