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
import java.util.Objects;
import java.util.Optional;

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

    @GetMapping("/popup/random")
    public String popup() {

        PokemonDetail data = infoService.getRandom().orElseThrow
                (PokemonNotFoundException::new);

        pokemonService.add(data.getSeq()); // 랜덤으로 뽑은 포켓몬을 마이 포켓몬에 저장

        request.setAttribute("data", data);
        request.setAttribute("addScript", List.of("mypage/profile", "mypage/info", "popup"));

        return "pokemon/popup";
    }

    @PostMapping("/popup")
    public String popupPs(@RequestParam("mode") String mode, @RequestParam("seq") long seq) {
        if (!memberUtil.isLogin()) {
            throw new UnAuthorizedException();
        }

        mode = Objects.requireNonNullElse(mode, "update");
        if (mode.equals("delete")) {  // 나의 띠부씰 선택 삭제
            pokemonService.delete(seq);
        } else if (mode.equals("delete-all")) {  // 나의 띠부씰 전체 삭제
            pokemonService.deleteAll();
        } else {  // 프로필 이미지 변경
            Member member = memberUtil.getMember();
            RequestMemberInfo form = new RequestMemberInfo();
            form.setMyPokemonSeq(seq);
            form.setUserName(member.getUserName());
            memberInfoService.update(form);
        }

        String script = "parent.parent.location.reload();";
        request.setAttribute("script", script);

        return "commons/execute_script";
    }

}