<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<fmt:setBundle basename="messages.commons" />
<fmt:message var="pageTitle" key="마이페이지" />
<c:url var="actionUrl" value="/member/login" />

<layout:main title="${pageTitle}">
    <div class="content-box small">
        <h1>${pageTitle}</h1>
        <h1>나의 띠부씰</h1>
    </div>
</layout:main>