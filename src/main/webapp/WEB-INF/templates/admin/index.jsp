<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<fmt:setBundle basename="messages.commons" />
<fmt:message var="pageTitle" key='관리자' />
<c:url var="actionUrl" value="/admin" />

<layout:main title="${pageTitle}">

<br>

<nav class="vertical">
  <div class="navrow">
    <div class="blank"></div>
  </div>
  <div class="navrow">
    <div class="sideMenu">관리자 프로필</div>
  </div>
  <div class="navrow">
    <div class="sideMenu">회원 관리</div>
  </div>
  <div class="navrow">
    <div class="sideMenu">게시글 관리</div>
  </div>
  </div>

  <div></div>
</nav>

<div class="dashboard">

내용을 입력하세요

</div>

</layout:main>