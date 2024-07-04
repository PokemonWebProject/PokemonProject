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
                <div class="myp">
                    <div class="myp_seq">${item.seq}</div>
                    <div class="myp-name">${item.nameKr}</div>
                 </div>
                <img src="${item.frontImage}" alt="${item.nameKr}">
            </label>
        </li>
    </c:forEach>
    </ul>
    <button type="button" class="button-action update" data-mode='update'>프로필 이미지 변경</button>
    <button type="button" class="button-action delete" data-mode="delete">선택 삭제</button>
    <button type="button" class="button-action delete-all" data-mode="delete-all">전체 삭제</button>
</form>
</c:if>