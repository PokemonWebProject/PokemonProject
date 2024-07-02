<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<c:url var="actionUrl" value="/admin/member/edit" />


<layout:admin title="회원정보 수정">

<table class="table-cols">
<tr>
    <th width="120">사용자 타입</th>
    <td>
    <input type="radio" name="userType" value="admin" id="userType_admin" checked>
    <label for="userType_admin">일반 사용자</label>

    <input type="radio" name="adminType" value="admin" id="adminType_admin" checked>
    <label for="adminType_admin">관리자</label>
    </td>
</tr>
<tr>
    <th>이메일</th>
    <td>${email}</td>
</tr>
<tr>
    <th>이름</th>
    <td>
    <input type="text" name="name" value="변경하려는 이름을 입력해주세요" >
    </td>
</tr>
</table>
</div>
</layout:admin>