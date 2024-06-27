<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/utils" %>
<c:url var="homeUrl" value="/" />
<c:url var="backimgUrl" value="/images/backimg.jpg" />

<layout:main>

   <section class="content-box">
        <h1> 오늘의 포켓몬! </h1>
        <util:memberOnly>
            <a href="<c:url value='/mypage' />"><button>뽑기</button></a>
        </util:memberOnly>
        <util:guestOnly>
            <a href="<c:url value='/member/login' />"><button>뽑기</button></a>
        </util:guestOnly>
   </section>
</layout:main>