package org.choongang.pokemon.controllers;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.choongang.global.ListData;
import org.choongang.global.Pagination;
import org.choongang.global.config.annotations.*;
import org.choongang.global.exceptions.UnAuthorizedException;
import org.choongang.member.MemberUtil;
import org.choongang.member.entities.Member;
import org.choongang.mypage.controllers.RequestMemberInfo;
import org.choongang.mypage.services.MyPokemonService;
import org.choongang.mypage.services.MemberInfoService;
import org.choongang.pokemon.entities.PokemonDetail;
import org.choongang.pokemon.exceptions.PokemonNotFoundException;
import org.choongang.pokemon.services.PokemonInfoService;

import java.util.List;

@Controller
@RequestMapping("/pokemon")
@RequiredArgsConstructor
public class PokemonController {

    private final PokemonInfoService infoService;
    private final HttpServletRequest request;

    private final MemberInfoService memberInfoService;
    private final MemberUtil memberUtil;

    private final MyPokemonService pokemonService;

    @GetMapping
    public String index(PokemonSearch search) {
        commonProcess();

        ListData<PokemonDetail> listData = infoService.getList(search);
        List<PokemonDetail> items = listData.getItems();
        Pagination pagination = listData.getPagination();

        request.setAttribute("items", items);
        request.setAttribute("pagination", pagination);

        request.setAttribute("addCss", new String[] {"pokemon/style", "pokemon/types"});

        return "pokemon/index";
    }

    @GetMapping("/{seq}")
    public String view(@PathVariable("seq") long seq) {
        commonProcess();

        PokemonDetail data = infoService.get(seq).orElseThrow(PokemonNotFoundException::new);

        request.setAttribute("data", data);

        return "pokemon/view";
    }

    private void commonProcess() {
        request.setAttribute("addCss", new String[] {"pokemon/style"});
        request.setAttribute("addScript", List.of("pokemon/wishlist"));
    }

    @GetMapping("/popup/{seq}")
    public String popup(@PathVariable("seq") long seq) {
        PokemonDetail data = infoService.get(seq).orElseThrow
                (PokemonNotFoundException::new);

        pokemonService.add(seq); // 랜덤으로 뽑은 포켓몬을 마이 포켓몬에 저장

        request.setAttribute("data", data);
        request.setAttribute("addScript", List.of("mypage/profile", "mypage/info", "popup"));

        return "pokemon/popup";
    }

    @PostMapping("/popup")
    public String popupPs(@RequestParam("seq") long seq){
        if (!memberUtil.isLogin()) {
            throw new UnAuthorizedException();
        }
        Member member = memberUtil.getMember();
        RequestMemberInfo form = new RequestMemberInfo();
        form.setMyPokemonSeq(seq);
        form.setUserName(member.getUserName());
        memberInfoService.update(form);

        String script = "parent.parent.location.reload();";
        request.setAttribute("script", script);

        return "commons/execute_script";
    }

}