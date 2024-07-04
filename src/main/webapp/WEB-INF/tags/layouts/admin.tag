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
<c:url var="homeUrl" value="/admin" />
<c:url var="logoUrl" value="/images/logo3.png" />

<layout:common title="${title}">
    <jsp:attribute name="header">
        <div class="left">
            <a href="http://localhost:4000/project/" class="logo">
                <img src="${logoUrl}" alt="로고">
            </a>
        </div>
        <div class="right">
        <div class="visitor">
             <span>관</span>
             <span>리</span>
             <span>자</span>
             <span>페</span>
             <span>이</span>
             <span>지</span>
             <span>에</span>
             <span>오</span>
             <span>신</span>
             <span>걸</span>
             <span>환</span>
             <span>영</span>
             <span>합</span>
             <span>니</span>
             <span>다</span>
             <br>
             <br>
            <span>오</span>
            <span>늘</span>
            <span>의</span>
            <span>방</span>
            <span>문</span>
            <span>자</span>
            <span>는</span>
            <span>총</span>
            <span><fmt:formatNumber value="${loginCount}" /></span>
            <span>명</span>
            <span>입</span>
            <span>니</span>
            <span>다. </span>

       오늘 접속한 방문자 수는  <fmt:formatNumber value="${loginCount}" /> 명 입니다.
        </div>
    </jsp:attribute>

    <jsp:attribute name="commonCss">
        <link rel="stylesheet" type="text/css" href="${cssUrl}admin/style.css">
    </jsp:attribute>
    <jsp:attribute name="commonJs">
        <script src="${jsUrl}admin/common.js"></script>

    </jsp:attribute>
    <jsp:body>

        <!-- 주 메뉴  -->

        <aside class="side-menu">

    <div>
    </div>
            <a href="${homeUrl}/member/list" class="menu${menuCode == 'member' ? ' on':''}">회원관리</a>
            <a href="${homeUrl}/board" class="menu${menuCode == 'board' ? ' on':''}">게시판 관리</a>

        </aside>
        <!-- 내용  영역  -->

        <section class="main-content">

            <div class="content-box">
                <!-- 요게 memberMenus.add(new String[] {"회원 목록" -- 0번, "/admin/member/personal" -- 1번});  -->
                <c:if test="${subMenus != null && !subMenus.isEmpty()}">
                <nav class="sub-menu">
                    <c:forEach var="menu" items="${subMenus}">
                        <a href="<c:url value='${menu[1]}' />">
                            ${menu[0]}
                        </a>
                    </c:forEach>
                </nav>
                </c:if>

                <jsp:doBody />
            </div>
        </section>
    </jsp:body>

</layout:common>