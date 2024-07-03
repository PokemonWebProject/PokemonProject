package org.choongang.file.controllers;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.apache.commons.fileupload2.core.DiskFileItem;
import org.apache.commons.fileupload2.jakarta.servlet6.JakartaServletDiskFileUpload;
import org.choongang.global.config.annotations.Controller;
import org.choongang.global.config.annotations.GetMapping;
import org.choongang.global.config.annotations.PostMapping;
import org.choongang.global.config.annotations.RequestMapping;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/file")
@RequiredArgsConstructor
public class FileUploadController {

    @GetMapping("/add")
    public String edit(HttpServletRequest request) {
        List<String> addCss = new ArrayList<>();
        List<String> addScript = new ArrayList<>();

        addCss.add("board");
        addCss.add("board/form");

        //addScript.add("ckeditor5/ckeditor");
        //addScript.add("board/form");
        addScript.add("fileUpload");

        request.setAttribute("addCss", addCss);
        request.setAttribute("addScript", addScript);

        return "file/add";
    }



    @PostMapping("/upload")
    String upload(HttpServletRequest request) {
        /*
        try {
            List<FileInfo> items = uploadService.uploads(req);
            items.stream().forEach(System.out::println);

        } catch(IOException e) {
            e.printStackTrace();
        }
        */

        //String uploadPath = request.getServletContext().getRealPath("/static/uploads");

        JakartaServletDiskFileUpload upload = new JakartaServletDiskFileUpload();
        upload.setSizeMax(1024 * 1024 * 20);
        try {
            List<DiskFileItem> items = upload.parseRequest(request);
            Map<String, String> params = new HashMap<>();
            for (DiskFileItem item : items) {
                if (item.isFormField()) { // 일반 양식 데이터
                    String name = item.getFieldName();
                    String value = item.getString(Charset.forName("UTF-8"));
                    params.put(name, value);
                } else{
                    String fileName = item.getName();
                    String fileType = item.getContentType();
                    System.out.println("fileName=" + fileName);
                    System.out.println("fileType=" + fileType);
                }
            }
        } catch (Exception e) {
            //e.printStackTrace();
        }
        return "file/index";
    }


}
