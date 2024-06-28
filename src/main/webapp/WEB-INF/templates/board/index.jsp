<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<fmt:setBundle basename="messages.commons" />
<fmt:message var="pageTitle" key='게시글_목록' />
<c:url var="actionUrl" value="" />
<layout:main title="${pageTitle}">
    <section class="content-box">
        <h1>${pageTitle} ${member.userNo}</h1>
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
                    <fmt:message key="읽은횟수" />
                </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach  var="board" items="${boards}" varStatus="status">
            <tr>

                    <!--
                    index: ${status.index} / count: ${status.count}<br>
                    first: ${status.first} / last: ${status.last}<br>
                    current: ${status.current}-->

                <td>
                    ${board.artNo}
                </td>
                <td>
                    ${board.artTitle}

                </td>
                <td>
                    ${board.userNo}
                </td>
                <td>
                    ${board.readCnt}
                </td>
                <td>
                    ${board.regDt}
                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="button-group">
            <a href="board/boardsave">
                <button type="button">
                    <fmt:message key="글쓰기" />
                </button>
            </a>
        </div>

    </section>
</layout:main>
