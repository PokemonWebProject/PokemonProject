package org.choongang.pick;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.choongang.global.config.annotations.Controller;
import org.choongang.global.config.annotations.GetMapping;
import org.choongang.global.config.annotations.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/pick")
@RequiredArgsConstructor
public class PickController {

    private final HttpServletRequest request;

    @GetMapping
    public String index() {

        request.setAttribute("addCss", List.of("mainPage/mainPage"));

        return "randompic/pick";
    }



}
