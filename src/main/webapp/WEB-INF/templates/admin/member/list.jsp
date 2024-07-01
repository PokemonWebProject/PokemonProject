
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/utils" %>

<c:url var="actionUrl" value="/admin/member/list" />
<layout:admin title="회원 목록">
<h1>회원 검색</h1>

<form name="frmSearch" method="GET" action="${actionUrl}" autocomplete="off">
    <table class="table-cols">
        <tr>
            <th>이메일</th>
            <td>
                <input type="text" name="email" value="${param.email}">
            </td>
            <th>회원명</th>
            <td>
                <input type="text" name="userName" value="${param.userName}">
            </td>
        </tr>
        <tr>
            <th>검색 키워드</th>
            <td colspan='3'>
                <input type="text" name="skey" value="${param.skey}">
            </td>
        <tr>
    </table>
     <button type="submit">검색하기</button>
</form>

<h2>회원 목록</h2>

<table class="table-rows">
    <thead>
        <tr>
            <th>회원번호</th>
            <th>이메일</th>
            <th>회원명</th>
            <th>회원종류</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
    <c:if test="${items == null || items.isEmpty()}">
        <tr>
            <td colspan="5">검색된 회원이 없습니다.</td>
        </tr>
    </c:if>
    <c:if test="${items != null && !items.isEmpty()}">
        <c:forEach var="item" items="${items}">
            <tr>
            <td colspan
                <td>${item.userNo}</td>
                <td>${item.email}</td>
                <td>${item.userName}</td>
                <td>${item.userType.title}</td>
                <td></td>
            </tr>
        </c:forEach>
      </c:if>
    </tbody>
</table>

<util:pagination />
</layout:admin>