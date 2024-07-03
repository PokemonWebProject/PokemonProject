<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:url var="mypageUrl" value="/mypage" />
<aside class="side-menu">
    <a href="${mypageUrl}">나의 프로필</a>
    <a href="${mypageUrl}/seal">나의 띠부씰</a>
    <a href="${mypageUrl}/info">회원정보 수정</a>
 </aside>