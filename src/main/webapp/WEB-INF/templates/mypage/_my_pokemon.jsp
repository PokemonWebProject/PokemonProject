<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:if test="${items != null && !items.isEmpty()}">

<form id="frmList" name="frmList" method="POST" action="<c:url value='/pokemon/popup' />" target="ifrmProcess">
    <input type="hidden" name="mode" value="update">
    <ul class="pokemon-items">
    <c:forEach var="item" items="${items}">
        <li class="item">
            <input type="radio" name="seq" value="${item.seq}" id="seq_${item.seq}">
            <label for="seq_${item.seq}">
                <span class="myseal">
                    <span class="myseal_seq">${item.seq}</span>
                    <span class="myseal-name">${item.nameKr}</span>
                 </span>
                <img src="${item.frontImage}" alt="${item.nameKr}">
                <div class="seal-logo">
                    <img src="../images/logo4.png" alt="logo4">
                </div>
            </label>
        </li>
    </c:forEach>
    </ul>
    <button type="button" class="button-action update" data-mode='update'>프로필 이미지 변경</button>
    <button type="button" class="button-action delete" data-mode="delete">선택 삭제</button>
    <button type="button" class="button-action delete-all" data-mode="delete-all">전체 삭제</button>
</form>
</c:if>