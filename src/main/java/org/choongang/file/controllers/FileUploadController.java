package org.choongang.file.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import org.choongang.file.models.FileInfo;
import org.choongang.file.models.FileServiceManager;
import org.choongang.file.models.FileUploadService;
import org.choongang.global.config.annotations.Controller;
import org.choongang.global.config.annotations.GetMapping;
import org.choongang.global.config.annotations.RequestMapping;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/file")
public class FileUploadController {


    @GetMapping("/upload")
    String index(HttpServletRequest req) throws ServletException, IOException {

        FileUploadService uploadService = FileServiceManager.getInstance().fileUploadService();

        List<FileInfo> items = uploadService.uploads(req);
        items.stream().forEach(System.out::println);


        return "file/index";
    }
}
