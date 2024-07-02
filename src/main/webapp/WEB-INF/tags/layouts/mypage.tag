<%@ tag body-content="scriptless" %>
<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/utils" %>
<%@ attribute name="title" %>
<fmt:setBundle basename="messages.commons" />
<c:url var="cssUrl" value="/css/" />
<c:url var="jsUrl" value="/js/" />
<c:url var="homeUrl" value="/" />
<c:url var="searchUrl" value="/board/search" />
<c:url var="logoUrl" value="/images/logo.png" />
<c:url var="profileUrl" value="/images/profileimg.png" />

<layout:common title="${title}">
    <jsp:attribute name="header">
        <section class="site-top">
            <div class="layout-width inner">
                <div class="left">
                    <a href="${homeUrl}">
                        <i class="xi-home-o"></i>
                        <fmt:message key="홈" />
                    </a>
                </div>
                 <style>
                     div {
                          text-align: center;

                          }
                 </style>
                <div class="right">
                    <util:guestOnly>
                        <a href="<c:url value='/member/join' />">
                            <i class="xi-user-plus-o"></i>
                            <fmt:message key="회원가입" />
                        </a>
                        <a href="<c:url value='/member/login' />">
                            <i class="xi-log-in"></i>
                            <fmt:message key="로그인" />
                        </a>
                    </util:guestOnly>
                    <util:memberOnly>
                        <img src="${profileUrl}" class="profileImage">
                        <fmt:message key="LOGIN_MSG">
                            <fmt:param>${loggedMember.userName}</fmt:param>
                        </fmt:message>
                        <a href="<c:url value='/mypage' />">
                            <fmt:message key="마이페이지" />
                        </a>
                        <a href="<c:url value='/member/logout' />">
                            <fmt:message key="로그아웃" />
                        </a>

                       <a href="<c:url value='/admin' />" target="_blank">
                            <fmt:message key="사이트_관리" />
                            <i class="xi-lock"></i>
                       </a>
                    </util:memberOnly>

                </div>
            </div>
        </section>
        <section class="logo-search">
            <div class="layout-width inner">

                <div class="top">
                    <form class="search-box" method="GET" action="${searchUrl}" autocomplete="off">
                        <input type="text" name="keyword" placeholder="<fmt:message key='검색어를_입력하세요.' />">
                        <button type="submit">
                            <i class="xi-search"></i>
                        </button>
                    </form>
                </div>

                <div class="bottom">
                    <a href="${homeUrl}" class="logo">
                        <img src="${logoUrl}" alt="<fmt:message key='로고' />">
                    </a>
                </div>
            </div>
        </section>
        <nav>
            <div class="layout-width inner">
                <a href="<c:url value='/board' />" target="_self">
                자유게시판
                </a>
                <a href="<c:url value='/pokemon' />" target="_self">
                포켓몬 도감
                </a>
                <a href="<c:url value='/pick' />" target="_blank">
                포켓몬 뽑기
                </a>
            </div>
        </nav>
    </jsp:attribute>
    <jsp:attribute name="footer">
        <section class="layout-width inner">
            <div class="footerText">
                <a href="https://github.com/GroupStudy502/Project_WebPage" target="_blank">
                    choongang class502 2nd gruop
                </a>
            </div>
        </section>
    </jsp:attribute>
    <jsp:attribute name="commonCss">
        <link rel="stylesheet" type="text/css" href="${cssUrl}main.css">
        <link rel="stylesheet" type="text/css" href="${cssUrl}mypage/style.css">
    </jsp:attribute>
    <jsp:attribute name="commonJs">
        <script src="${jsUrl}main.js"></script>
    </jsp:attribute>
    <jsp:body>
        <section class="layout-width mypage">
            <aside class="side-menu">
                <a href="${homeUrl}mypage/seal">나의 띠부씰</a>
                <a href="${homeUrl}mypage/info">회원정보 수정</a>
            </aside>
            <section class="main-content">
                <h1>마이페이지</h1>
                <jsp:doBody />
            </section>
        </section>
    </jsp:body>
</layout:common>