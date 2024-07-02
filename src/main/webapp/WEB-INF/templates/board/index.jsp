<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/utils" %>
<fmt:setBundle basename="messages.commons" />
<fmt:message var="pageTitle" key='게시글_목록' />
<c:url var="viewUrl" value="/board/view" />
<c:url var="updateUrl" value="/board/save" />
<c:url var="deleteUrl" value="/board/delete" />
<c:url var="searchUrl" value="/board/list/" />
<script>
    function fn_search() {

        let keyword = document.getElementById("keyword").value;
        location.replace("${searchUrl}" + keyword );
    }
</script>
<layout:main title="${pageTitle}">
    <section class="board-box">
        <h1>${pageTitle}</h1>
        <table  class="table-rows">
            <thead>
            <tr>
                <th>
                    <fmt:message key="번호" />
                </th>
                <th>
                    <fmt:message key="제목" />

                </th>
                <th>
                    <fmt:message key="작성자" />
                </th>
                <th>
                    <fmt:message key="작성일" />
                </th>
                <th>
                    <fmt:message key="조회" />
                </th>
                <th>
                    <fmt:message key="수정_삭제" />
                </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach  var="board" items="${boards}" varStatus="status">
            <tr>
                <td>
                    <a href="${viewUrl}/${board.artNo}">${board.artNo}</a>
                </td>
                <td>
                    <a href="${viewUrl}/${board.artNo}">${board.artTitle}</a>

                </td>
                <td>
                    ${board.userName}
                </td>
                <td>
                    <util:formatDate value="${board.regDt}" pattern="yyyy.MM.dd HH:mm" />
                </td>
                <td>
                    ${board.readCnt}
                </td>
                <td>
                    <a href="${updateUrl}/${board.artNo}"> <fmt:message key="수정하기" /></a> |
                    <a href="${deleteUrl}/${board.artNo}"> <fmt:message key="삭제하기" /></a>
                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="board-button-group">
            <div class="boardButton">
                <a href="${updateUrl}">
                    <fmt:message key="글쓰기" />
                </a>
            </div>
            <!--
            <div class="boardButton">
                <input type="text" id="keyword" class="keyword" name="keyword" placeholder="검색어 : 제목">
            </div>
            <div class="boardButton">
                <a href="#" onclick="fn_search()"><fmt:message key="검색" /></a>
            </div>
    -->
            <div class=" board-search">
                <input type="text" name="keyword" id="keyword" placeholder="제목,본문,작성자 검색">
                <button onclick="fn_search()">
                    <i class="xi-search"></i>
                </button>
            </div>
        </div>

    </section>
</layout:main>
