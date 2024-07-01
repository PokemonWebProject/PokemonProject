<%@ tag body-content="empty" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:if test="${pagination != null}">
    <div class='pagination'>
        <c:if test="${pagination.prevRangePage > 0}">
            <a href="<c:url value='${pagination.baseURL}page=1' />"><i class="xi-backward"></i></a>
            <a href="<c:url value='${pagination.baseURL}page=${pagination.prevRangePage}' />"><i class="xi-angle-left"></i></a>
        </c:if>
        <c:forEach var="page" items="${pagination.pages}">
            <a class="page${pagination.page == Integer.parseInt(page[0])?' on':''}" href="<c:url value='${page[1]}' />">${page[0]}</a>
        </c:forEach>
        <c:if test="${pagination.nextRangePage > 0}">
            <a href="<c:url value='${pagination.baseURL}page=${pagination.nextRangePage}' />"><i class="xi-angle-right"></i></a>
            <a href="<c:url value='${pagination.baseURL}page=${pagination.totalPages}' />"><i class="xi-forward"></i></a>
        </c:if>
    </div>
</c:if>