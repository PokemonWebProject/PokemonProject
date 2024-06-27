<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<c:url var="backimgUrl" value="/images/backimg.jpg" />
<layout:main>
    <!-- 내용 영역 -->
               <section class="content">
                     <a href="${homeUrl}" class="backimg">
                        <img src="${backimgUrl}" alt="<fmt:message key='백그라운드이미지' />">
                    </a>
               </section>
</layout:main>