<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<fmt:setBundle basename="messages.commons" />
<fmt:message var="pageTitle" key='게시글_목록' />
<c:url var="updateUrl" value="/board/save" />
<c:url var="deleteUrl" value="/board/delete" />
<c:url var="searchUrl" value="/board/list/" />
<script>
    function fn_search() {

        //let keyword = encodeURI(document.getElementById("keyword").value);
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
                    ${board.artNo}
                </td>
                <td>
                    ${board.artTitle}

                </td>
                <td>
                    ${board.userName}
                </td>
                <td>
                    ${board.regDt}
                </td>
                <td>
                    ${board.readCnt}
                </td>
                <td>
                    <a href="${updateUrl}/${board.artNo}"> <fmt:message key="수정하기" /></a>
                    <a href="${deleteUrl}/${board.artNo}"> <fmt:message key="삭제하기" /></a>
                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
        <div>
            <a href="board/save">
                <button type="button">
                    <fmt:message key="글쓰기" />
                </button>
            </a>
            <input type="text" id="keyword" class="keyword" name="keyword" placeholder="검색어 : 제목">
            <button type="button" onclick="fn_search()"><fmt:message key="검색" />
            </button>
        </div>

    </section>
</layout:main>
