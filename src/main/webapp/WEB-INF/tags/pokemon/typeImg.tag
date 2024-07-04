<%@ tag body-content="empty" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ attribute name="value" required="true" %>
<c:url var="imageUrl" value="/images/pokemon/" />

<c:if test="${value == '노말'}">
    <img src='${imageUrl}normal.png'>
</c:if>
<c:if test="${value == '격투'}">
    <img src='${imageUrl}fighting.png'>
</c:if>
<c:if test="${value == '비행'}">
    <img src='${imageUrl}flying.png'>
</c:if>
<c:if test="${value == '독'}">
    <img src='${imageUrl}poison.png'>
</c:if>
<c:if test="${value == '땅'}">
    <img src='${imageUrl}ground.png'>
</c:if>
<c:if test="${value == '바위'}">
    <img src='${imageUrl}rock.png'>
</c:if>
<c:if test="${value == '벌레'}">
    <img src='${imageUrl}bug.png'>
</c:if>
<c:if test="${value == '고스트'}">
    <img src='${imageUrl}ghost.png'>
</c:if>
<c:if test="${value == '강철'}">
    <img src='${imageUrl}steel.png'>
</c:if>
<c:if test="${value == '불'}">
    <img src='${imageUrl}fire.png'>
</c:if>
<c:if test="${value == '물'}">
    <img src='${imageUrl}water.png'>
</c:if>
<c:if test="${value == '풀'}">
    <img src='${imageUrl}grass.png'>
</c:if>
<c:if test="${value == '전기'}">
    <img src='${imageUrl}electric.png'>
</c:if>
<c:if test="${value == '에스퍼'}">
    <img src='${imageUrl}psychic.png'>
</c:if>
<c:if test="${value == '얼음'}">
    <img src='${imageUrl}ice.png'>
</c:if>
<c:if test="${value == '드래곤'}">
    <img src='${imageUrl}dragon.png'>
</c:if>
<c:if test="${value == '악'}">
    <img src='${imageUrl}dark.png'>
</c:if>
<c:if test="${value == '페어리'}">
    <img src='${imageUrl}fairy.png'>
</c:if>
<c:if test="${value == '스텔라'}">
    <img src='${imageUrl}stellar.png'>
</c:if>
