<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/utils" %>

<c:url var="actionUrl" value="/admin/member/personal" />

<h2>회원 검색</h2>

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
            <td colspan='1'>
                <input type="text" name="skey" value="${param.skey}">
            </td>
            <th> 사용자 타입 </th>
            <td>
            <input type="text" name="userType" value="${param.userType}">
            </td>
        <tr>
    </table>
<br>
    <button class="btn-hover color-9">검색하기</button>


</form>
</layout:admin>