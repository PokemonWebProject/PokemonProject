package org.choongang.board.validators;

import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.choongang.board.controllers.RequestBoardSave;
import org.choongang.board.mappers.BoardMapper;
import org.choongang.global.config.annotations.Component;
import org.choongang.global.exceptions.AlertException;
import org.choongang.global.validators.RequiredValidator;
import org.choongang.global.validators.Validator;

@Component
@RequiredArgsConstructor
public class BoardValidator implements Validator<RequestBoardSave>, RequiredValidator {

    private BoardMapper mapper;

    @Override
    public void check(RequestBoardSave form) {
        String artTitle = form.getArtTitle();
        String artBody = form.getArtBody();
        /* 필수항목 검사 */
        int status = HttpServletResponse.SC_BAD_REQUEST;

        checkRequired(artTitle, new AlertException("제목을 입력하세요", status));
        checkRequired(artBody, new AlertException("본문을 입력하세요", status));
    }
}
