<%@ tag body-content="empty" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ attribute name="value" required="true" %>
<c:url var="imageUrl" value="/images/pokemon/" />
<c:if test="${value == '풀'}">
    <img src='${imageUrl}grass.png'>
</c:if>
<c:if test="${value == '강철'}">
    <img src='${imageUrl}grass.png'>
</c:if>