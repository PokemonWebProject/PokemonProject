<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>

<layout:mypage title="마이페이지">
    <section class="content-box3">
        <h2>나의 프로필</h2>
        <dl>
            <dd>
                <c:if test="${myProfile != null}">
                <div>${loggedMember.userName}님</div>
                <br>
                <div class='profile'>
                    <img src="${myProfile.frontImage}" alt="${myProfile.nameKr}">
                    <div>${myProfile.nameKr}</div>
                </div>
                </c:if>
            </dd>
        </dl>
    </section>
</layout:mypage>