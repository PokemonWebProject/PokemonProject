<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<c:url var="actionUrl" value="/admin/member/edit" />


<layout:admin title="회원정보 수정">
<h1>회원정보 수정</h1>

<i class="xi-border-color"></i>

<form name="frmUpdate" method="POST" action="${actionUrl}" target="ifrmProcess" autocomplete="off">
<table class="table-update">

<dl>
<dt>사용자 타입</dt>
<dd>
<input type="radio" name="userType" value="admin" id="userType_admin" checked>
<label for="userType_admin">일반 사용자</label>

<input type="radio" name="adminType" value="admin" id="adminType_admin" checked>
<label for="adminType_admin">관리자</label>
</dd>
</dl>

<dl>
<dt>이메일</dt>
</dl>

<dl>
<dt>이름</dt>
</dl>


</table>
</from>
</layout:admin>