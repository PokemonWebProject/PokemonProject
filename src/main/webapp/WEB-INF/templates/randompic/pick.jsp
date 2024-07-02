<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/utils" %>
<c:url var="randompickUrl" value="/pick" />
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
            <a href="<c:url value='/mypage' />" onclick="alert('당신의 포켓몬 뽑기 완료!!')">
            <button class="poke-button"  id="generate-profile-image">
                띠부띠부씰 뽑기
            </button></a>
        </util:memberOnly>
        <util:guestOnly>
            <a href="<c:url value='/member/login' />"><button class="poke-button">띠부띠부씰 뽑기</button></a>
        </util:guestOnly>
   </section>
   </div>
</layout:main>