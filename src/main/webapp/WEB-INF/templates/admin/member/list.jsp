<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/utils" %>


<layout:admin title="회원 관리">
<h1>회원 목록</h1>
<c:url var="searchUrl" value="/admin/member/list" />
<c:url var="actionUrl" value="/admin/member/process" />
<form name="frmSearch" method="GET" action="${searchUrl}" autocomplete="off">
    <table class="table-cols mb25">
        <tr>
            <th width="120" >이메일</th>
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
                <input type="radio" name="userType" value="" id="userType_ALL"${empty param.userType ? ' checked':''}>
                <label for="userType_ALL">전체</label>
                <input type="radio" name="userType" value="USER" id="userType_USER"${param.userType == 'USER' ? ' checked':''}>
                <label for="userType_USER">일반사용자</label>
                <input type="radio" name="userType" value="ADMIN" id="userType_ADMIN"${param.userType == 'ADMIN' ? ' checked':''}>
                <label for="userType_ADMIN">관리자</label>
            </td>
        <tr>
    </table>
    <div class='ac'>

<button type="submit" class="btn-two green rounded">검색하기</button>


     </div>
</form>



<br>

<form name="frmSearch" method="POST" action="${actionUrl}" autocomplete="off" target="ifrmProcess">
 <table class="table-rows">
      <thead>
        <tr>
          <th>
            <input type='checkbox' class='checkall' data-target-name="chk">
          </th>
          <th class="pin"> 회원번호 </th>
          <th>이메일</th>
          <th>이름</th>
          <th>사용자 타입</th>
        </tr>
      </thead>

      <tbody>
          <c:if test="${items == null || items.isEmpty()}">
                <tr>
                    <td colspan="5">검색된 회원이 없습니다.</td>
                </tr>
            </c:if>
            <c:if test="${items != null && !items.isEmpty()}">
                <c:forEach var="item" items="${items}" varStatus="status">
                    <tr>
                        <td>
                            <input type='hidden' name="email_${status.count}" value="${item.email}">
                            <input type="hidden" name="userNo_${status_count}" value="${item.userNo}">
                            <input type="checkbox" name="chk" value="${status.count}">
                        </td>
                        <td>${item.userNo}</td>
                        <td>${item.email}</td>
                        <td>
                            <input type="text" name="userName_${status.count}" value="${item.userName}">
                        </td>
                        <td>
                            <select name="userType_${status.count}">
                                <option value="USER"${item.userType.name() == 'USER' ? 'selected' : ''}>일반 사용자</option>
                                <option value="ADMIN"${item.userType.name() == 'ADMIN' ? 'selected' : ''}>관리자</option>
                            </select>
                        </td>
                    </tr>
                </c:forEach>
              </c:if>
              </tbody>

</table>

            </table>
            <div class='table-action'>
                <div>
                    선택한 회원을
                    <select name="mode">
                        <option value='update'>수정</option>
                        <option value='delete'>삭제</option>
                    </select>
                     <button type='submit' onclick="return confirm('정말 처리하시겠습니까?');">처리하기</button>
                </div>

            </div>
        </form>

     <util:pagination />

</layout:admin>