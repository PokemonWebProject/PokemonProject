package org.choongang.file.services;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.apache.commons.fileupload2.core.DiskFileItem;
import org.apache.commons.fileupload2.jakarta.servlet6.JakartaServletDiskFileUpload;
import org.choongang.file.entities.FileInfo;
import org.choongang.global.config.annotations.Service;
import org.choongang.global.config.containers.BeanContainer;

import java.io.File;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class FileUploadService {
    private final FileInfoSaveService saveService;
    private final FileInfoService infoService;

    /**
     *  파일 업로드 절차
     *  1. 파일정보 저장
     *  2. 저장정보중에서 seq번호를 가지고 파일 업로드 경로, 파일명 - 중복방지
     *  - filePath
     *  3. 서버에 파일 저장
     *  4. 저장한 파일 정보 목록 반환
     * @return
     */
    public List<FileInfo> uploads() {
        HttpServletRequest request = BeanContainer.getInstance().getBean(HttpServletRequest.class);
        JakartaServletDiskFileUpload upload = new JakartaServletDiskFileUpload();
        upload.setSizeMax(30 * 1024 * 1024); //최대 파일 업로드 용량 30MB

        String gid = null, location = null;
        try {
            List<DiskFileItem> items = upload.parseRequest(request);

            //양식 데이터 분리
            Map<String, String> formData = new HashMap<>();

            for(DiskFileItem item : items) {
                if(item.isFormField()) {
                    String name = item.getFieldName();
                    String value = item.getString(Charset.forName("UTF-8"));
                    formData.put(name, value);
                }

            }
            gid = formData.getOrDefault("gid", UUID.randomUUID().toString());
            location = formData.getOrDefault("location", "");

            for(DiskFileItem item : items) {
                if(item.isFormField()) {
                    continue;
                }
                String fileName = item.getName();
                String extension = fileName.substring(fileName.lastIndexOf(".") + 1);
                String contentType = item.getContentType();
                FileInfo fileInfo = FileInfo.builder()
                        .gid(gid)
                        .location(location)
                        .fileName(fileName)
                        .extension(extension)
                        .contentType(contentType)
                        .build();
                fileInfo = saveService.save(fileInfo);
                if(fileInfo == null) {
                    continue;
                }
                //파일 경로 저장
                String filePath = fileInfo.getFilePath();
                File file = new File(filePath);
                item.write(file.toPath());
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
