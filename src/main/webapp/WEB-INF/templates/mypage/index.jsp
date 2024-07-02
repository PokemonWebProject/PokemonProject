<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>

<layout:mypage title="마이페이지">
    <dl>
        <dt>프로필 이미지</dt>
        <dd>
            <button type='button' id="generate-profile-image">
                프로필 이미지 변경
            </button>
        </dd>
    </dl>
</layout:mypage>