package org.choongang.file;

import org.apache.ibatis.session.SqlSession;
import org.choongang.file.entities.FileInfo;
import org.choongang.file.mappers.FileInfoMapper;
import org.choongang.global.config.DBConn;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.UUID;

public class MapperTest {

    private FileInfoMapper mapper;
    private SqlSession session;

    @BeforeEach
    void init() {
        SqlSession session = DBConn.getSession();

        mapper = DBConn.getSession().getMapper(FileInfoMapper.class);
    }

    @Test
    void registerTest() {
        String gid = UUID.randomUUID().toString();
        String location1 = "loc1";
        String location2 = "loc2";
        for (int i = 0; i < 10; i++) {
            FileInfo item = FileInfo.builder()
                    .gid(gid)
                    .location(location2)
                    .fileName("파일" + i + ".png")
                    .contentType("image/png")
                    .extension("png")
                    .build();
            mapper.register(item);
        }
    }
    @Test
    void getListTest() {
        String gid = "8ce65ebd-6bca-4d12-b361-cf4943438435";
        List<FileInfo> items = mapper.getList(gid, null);
        items.forEach(System.out::println);
    }

    @Test
    void updateDoneTest() {
        String gid = "6d0ca375-69da-44d5-bf6e-1f0b4b585f90";
        mapper.updateDone(gid);
    }

    @Test
    void deleteTest() {
        mapper.delete(10L);
    }
    @Test
    void deletesTest() {
        String gid = "6d0ca375-69da-44d5-bf6e-1f0b4b585f90";
        int result = mapper.deletes(gid, "loc1");
    }

}
