<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<layout:popup>
	<section class="popup-view">
	<form method="post" action="<c:url value='/pokemon/popup' />"autocomplete="off" target="ifrmProcess">
		<input type="hidden" name="seq" value="${data.seq}">
		<img src="${data.frontImage}" class="profileimg" alt="${data.nameKr}">
		<div class="name">
		   <h1>${data.nameKr}</h1>
		</div>

		<div class="explain">${fn:replace(data.description, '\\n', '<br>')}</div>

		<div class="button-group">
		            <a href="<c:url value='/pokemon/popup/random' />">
        			    <button type="button" class="button">다시 뽑기</button>
        			</a>
        			<button type="submit" class="button">프로필 설정</button>
        			<button type="button" class="button" onclick="parent.commonLib.popup.close();">닫기</button>
        		</div>
	</form>
	</section>
</layout:popup>