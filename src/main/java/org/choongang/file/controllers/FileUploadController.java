package org.choongang.file.controllers;

import jakarta.servlet.http.HttpServletRequest;
import org.choongang.global.config.annotations.Controller;
import org.choongang.global.config.annotations.GetMapping;
import org.choongang.global.config.annotations.RequestMapping;

@Controller
@RequestMapping("/file")
public class FileUploadController {


    @GetMapping("/upload")
    String index(HttpServletRequest req) {
        /*
        FileUploadService uploadService = FileServiceManager.getInstance().fileUploadService();

        List<FileInfo> items = uploadService.uploads(req);
        items.stream().forEach(System.out::println);


         */
        return "file/index";
    }
}
