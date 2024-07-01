<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<c:url var="infoUrl" value="/mypage/info" />
<c:url var="sealUrl" value="/mypage/seal" />

<layout:main title="마이페이지">
    <section class="layout-width">
        <div class="content-box3">
            <h1>마이페이지</h1>
            <a href="${sealUrl}">나의 띠부씰</a>
            <a href="${infoUrl}">회원정보 수정</a>
        </div>
    </section>
</layout:main>