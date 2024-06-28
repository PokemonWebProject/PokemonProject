<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/utils" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<fmt:message var="pageTitle" key="띠부띠부씰" />
<c:url var="actionUrl" value="/pick" />
<c:url var="backimgUrl" value="/images/backimg.jpg" />
<c:url var="pickUrl" value="/images/pick.png" />

<layout:main>
   <section class="content-box">
        <h1> 오늘의 포켓몬! </h1>
        <div class="image-container">
             <img src="${pickUrl}">
        </div>
        <util:memberOnly>
            <a href="<c:url value='/mypage' />"><button class="poke-button">띠부띠부씰 뽑기</button></a>
        </util:memberOnly>
        <util:guestOnly>
            <a href="<c:url value='/member/login' />"><button class="poke-button">띠부띠부씰 뽑기</button></a>
        </util:guestOnly>
   </section>
</layout:main>