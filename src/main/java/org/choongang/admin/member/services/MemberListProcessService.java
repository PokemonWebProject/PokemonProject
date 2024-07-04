package org.choongang.admin.member.services;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.choongang.global.config.annotations.Service;
import org.choongang.global.config.containers.BeanContainer;
import org.choongang.global.exceptions.AlertException;
import org.choongang.member.constants.UserType;
import org.choongang.member.entities.Member;
import org.choongang.member.mappers.MemberMapper;

import java.util.Arrays;

@Service
@RequiredArgsConstructor
public class MemberListProcessService {
    private final MemberMapper mapper;

    /**
     * mode - update :  수정
     * delete :  삭제
     *
     * @param mode
     */
    public void process(String mode) {
        HttpServletRequest request = BeanContainer.getInstance().getBean(HttpServletRequest.class);

        String strMode = mode.equals("delete") ? "삭제" : "수정";


        String[] chks = request.getParameterValues("chk");

        if (chks == null || chks.length == 0) {
            throw new AlertException(strMode + "할 회원을 선택하세요.", HttpServletResponse.SC_BAD_REQUEST);
        }

        for (String chk : chks) {
            String email = request.getParameter("email_" + chk);


            if (mode.equals("delete")) { // 삭제
                mapper.delete(email);

            } else { // 수정
                String userName = request.getParameter("userName_" + chk);
                String userType = request.getParameter("userType_" + chk);

                Member member = Member.builder()
                        .userName(userName)
                        .userType(UserType.valueOf(userType))
                        .email(email)
                        .build();
                mapper.modify(member);
            }

        }

    }
}
