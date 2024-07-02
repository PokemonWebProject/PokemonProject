package org.choongang.file.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.choongang.file.models.FileInfo;
import org.choongang.file.models.FileUploadService;
import org.choongang.global.config.annotations.Controller;
import org.choongang.global.config.annotations.GetMapping;
import org.choongang.global.config.annotations.RequestMapping;

import java.io.IOException;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/file")
public class FileUploadController {
    private final FileUploadService uploadService;

    @GetMapping("/edit")
    String edit() {
        return "file/edit";
    }

    @GetMapping("/upload")
    String index(HttpServletRequest req) throws ServletException, IOException {

        List<FileInfo> items = uploadService.uploads(req);
        items.stream().forEach(System.out::println);

        return "file/index";
    }
}
