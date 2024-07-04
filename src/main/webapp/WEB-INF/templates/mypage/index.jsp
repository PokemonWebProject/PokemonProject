<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<c:url var="homeUrl" value="/" />

<layout:main title="마이페이지">
    <jsp:attribute name="side">
        <jsp:include page="_side.jsp" />
    </jsp:attribute>

    <jsp:body>
        <section class="content-box3">
            <div class="inner">
                <h1>나의 프로필</h1>
                <dl>
                    <dd>
                        <c:if test="${myProfile != null}">
                        <div class="myprofile-name">${loggedMember.userName}님</div>
                        <br>
                        <div class="myprofile">
                            <img src="${myProfile.frontImage}" alt="${myProfile.nameKr}">
                            <div>${myProfile.nameKr}</div>
                        </div>
                        </c:if>
                    </dd>
                </dl>
            </div>
        </section>
    </jsp:body>
</layout:main>