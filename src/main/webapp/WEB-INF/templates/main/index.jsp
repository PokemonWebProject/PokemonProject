<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/utils" %>

<c:url var="homeUrl" value="/" />
<c:url var="randomUrl" value='/pokemon/popup/random' />
<c:url var="backimgUrl" value="/images/backimg.jpg" />
<c:url var="pickUrl" value="/images/pick.png" />

<layout:main>
   <div class="content-box-wrapper">
   <section class="content-box">
        <h1> 오늘의 포켓몬! </h1>
        <div class="image-container">
             <img src="${pickUrl}">
        </div>
        <util:memberOnly>
            <button class="poke-button" type='button' onclick="commonLib.popup.open('${randomUrl}', 600, 600);">
                띠부띠부씰 뽑기
            </button></a>
        </util:memberOnly>
        <util:guestOnly>
            <a href="<c:url value='/member/login' />"><button class="poke-button">띠부띠부씰 뽑기</button></a>
        </util:guestOnly>
   </section>
   </div>
</layout:main>