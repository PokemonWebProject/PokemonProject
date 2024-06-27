package org.choongang.admin.controllers;

import org.choongang.global.config.annotations.Controller;
import org.choongang.global.config.annotations.GetMapping;
import org.choongang.global.config.annotations.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @GetMapping("/board")
    public String index() {
        return "admin/index";
    }
}

