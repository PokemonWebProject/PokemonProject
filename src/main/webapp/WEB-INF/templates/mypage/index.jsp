<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<c:url var="actionUrl" value="/mypage/idnex" />
<c:url var="infoUrl" value="/mypage/info" />
<c:url var="sealUrl" value="/mypage/seal" />

<layout:main title="마이페이지">
    <section class="layout-width">
        <div class="content-box3">
            <h1>마이페이지</h1>
                <form name="frmSave" method="POST" action="${actionUrl}" target="ifrmProcess" autocomplete="off">
                    <dl>
                        <dt>프로필 이미지</dt>
                        <dd>
                            <button type='button' id="generate-profile-image">
                            랜덤 프로필 이미지
                            </button>
                        </dd>
                    </dl>
                </form>

            <br><br>

            <a href="${sealUrl}">나의 띠부씰</a>
            <a href="${infoUrl}">회원정보 수정</a>
        </div>
    </section>
</layout:main>