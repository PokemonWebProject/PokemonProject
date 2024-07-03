package org.choongang.file.models;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.apache.commons.fileupload2.core.DiskFileItem;
import org.apache.commons.fileupload2.jakarta.servlet6.JakartaServletDiskFileUpload;
import org.choongang.file.FileInfoMapper;
import org.choongang.global.config.annotations.Service;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Path;
import java.util.*;

@Service
@RequiredArgsConstructor
public class FileUploadService {
    private final FileInfoMapper mapper;


    public List<FileInfo> uploads(HttpServletRequest request) throws IOException {

        //long userNo = MemberUtil.isLogin() ? MemberUtil.getMember().getUserNo() : 0;

        String uploadPath = request.getServletContext().getRealPath("/static/uploads");

        JakartaServletDiskFileUpload upload = new JakartaServletDiskFileUpload();
        upload.setSizeMax(1024 * 1024 * 20);

        List<DiskFileItem> items = upload.parseRequest(request);
        // 일반 양식 데이터 처리 S
        Map<String, String> params = new HashMap<>();
        for (DiskFileItem item : items) {
            if (item.isFormField()) { // 일반 양식 데이터
                String name = item.getFieldName();
                String value = item.getString(Charset.forName("UTF-8"));
                params.put(name, value);
            }
        }
        // 일반 양식 데이터 처리 E

        // 파일 업로드 처리 S
        String gid = params.get("gid");
        gid = gid == null || gid.isBlank() ? UUID.randomUUID().toString() : gid;

        String location = params.get("location");

        List<FileInfo> uploadedFiles = new ArrayList<>(); // 업로드 성공 파일 목록
        for (DiskFileItem item : items) {
            if (!item.isFormField()) {
                String fileName = item.getName();
                String fileType = item.getContentType();
                String extension = fileName.substring(fileName.lastIndexOf(".") + 1);

                FileInfo fileInfo = new FileInfo();
                fileInfo.setGid(gid);
                fileInfo.setLocation(location);
                fileInfo.setFileName(fileName);
                fileInfo.setFileType(fileType);
                fileInfo.setExtension(extension);
                //fileInfo.setUserNo(userNo);

                System.out.println("파일 저장 전!");
                mapper.add(fileInfo);
                long id = fileInfo.getId();
                if (id > 0L) { // 파일 정보 저장 실패
                    System.out.println("파일 저장 완료!");
                    System.out.println(fileInfo);

                    File dir = new File(uploadPath + "/" + (id % 10));
                    if (!dir.exists()) { // 디렉토리가 없는 경우
                        dir.mkdir();
                    }

                    String uploadFileName = id + "." + extension;
                    File file = new File(dir, uploadFileName);
                    Path path = Path.of(file.getPath());
                    item.write(path);

                    uploadedFiles.add(fileInfo);
                }
            }
        }

        // 파일 업로드 처리 E

        return uploadedFiles;
    }
}