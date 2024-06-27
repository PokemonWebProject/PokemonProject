<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<fmt:setBundle basename="messages.commons" />
<fmt:message var="pageTitle" key='관리자' />
<c:url var="actionUrl" value="/admin" />

<layout:main title="${pageTitle}">

 <nav class="horizontal">
   <div></div>
   <div class="navItem">menu 1</div>
   <div class="navItem">menu 2</div>
   <div class="navItem">menu 3</div>
   <div class="navItem">menu 4</div>
   <div class="navItem">menu 5</div>
   <div></div>
 </nav>

 <br>

 <nav class="vertical">
   <div class="navrow">
     <div class="blank"></div>
   </div>
   <div class="navrow">
     <div class="navItem">회원 관리</div>
   </div>
   <div class="navrow">
     <div class="navItem">게시물 관리</div>
   </div>
   <div class="navrow">
     <div class="navItem">관리자 프로필</div>
   </div>

   </div>
   <div></div>
 </nav>

 <div class="dashboard">

내용을 쓰세요

 </div>


</layout:main>