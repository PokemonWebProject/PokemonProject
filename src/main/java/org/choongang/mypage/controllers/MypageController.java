package org.choongang.mypage.controllers;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.choongang.global.config.annotations.Controller;
import org.choongang.global.config.annotations.GetMapping;
import org.choongang.global.config.annotations.PostMapping;
import org.choongang.global.config.annotations.RequestMapping;
import org.choongang.member.MemberUtil;
import org.choongang.member.entities.Member;
import org.choongang.mypage.services.MyPokemonService;
import org.choongang.mypage.services.MemberInfoService;
import org.choongang.pokemon.entities.PokemonDetail;

import java.util.List;

@Controller
@RequestMapping("/mypage")
@RequiredArgsConstructor
public class MypageController {

    private final MemberInfoService memberInfoService;
    private final MyPokemonService pokemonService;
    private final HttpServletRequest request;
    private final MemberUtil memberUtil;

    /**
     * 마이페이지 메인
     *
     * @return
     */
    @GetMapping
    public String index() {
        commonProcess();

        return "mypage/index";
    }

    /**
     * 회원 정보 확인 및 수정
     *
     * @return
     */
    @GetMapping("/info")
    public String info() {
        commonProcess();

        return "mypage/info";
    }

    /**
     * 회원 정보 확인 및 수정
     * @return
     */
    @PostMapping("/info")
    public String infoPs(RequestMemberInfo form) {

        Member member = memberUtil.getMember();
        form.setMyPokemonSeq(member.getMyPokemonSeq());  // 회원정보 수정 시 마이포켓몬 데이터 고정
        memberInfoService.update(form);

        String url = request.getContextPath() + "/mypage";
        String script = String.format("parent.location.replace('%s');", url); // 회원정보 수정 후 페이지 새로고침

        request.setAttribute("script", script);

        return "commons/execute_script";
    }

    /**
     * 나의 띠부씰
     *
     * @return
     */
    @GetMapping("/seal")
    public String seal() {
        commonProcess();

        List<PokemonDetail> items = pokemonService.getList();

        request.setAttribute("items", items);

        return "mypage/seal";
    }

    private void commonProcess() {
        request.setAttribute("addCdd", List.of("mypage/style"));
    }
}