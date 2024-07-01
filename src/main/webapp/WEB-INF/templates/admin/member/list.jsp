<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/utils" %>


<layout:admin title="회원 목록">
<h1>회원 목록</h1>
<br>
<c:url var="actionUrl" value="/admin/member/list" />
<form name="frmSearch" method="GET" action="${actionUrl}" autocomplete="off">
    <table class="table-cols">
        <tr>
            <th width="150">이메일</th>
            <td width="300">
                <input type="text" name="email" value="${param.email}">
            </td>
            <th width="150">회원명</th>
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



<br>

<form name="frmSearch" method="GET" action="${actionUrl}" autocomplete="off">

 <table>
      <thead>
        <tr>
          <th class="pin"> 회원번호 </th>
          <th>이메일</th>
          <th>이름</th>
          <th>사용자 타입</th>

        </tr>
      </thead>

      <tbody>
        <tr>

        </tr>

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

                    </tr>
                </c:forEach>
              </c:if>

        </table>

        <util:pagination />
        </form>

</tbody>



</layout:admin>