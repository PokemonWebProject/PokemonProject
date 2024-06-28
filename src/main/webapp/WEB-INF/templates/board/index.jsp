<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<fmt:setBundle basename="messages.commons" />
<fmt:message var="pageTitle" key='게시글목록' />
<c:url var="actionUrl" value="" />
<layout:main title="${pageTitle}">
    <section class="content-box">
        <h1>${pageTitle} ${member.userNo}</h1>

        <table border="1">
            <tr>
                <td>
                    <fmt:message key="제목" />
                </td>
                <td>
                    <fmt:message key="제목" />

                </td>
                <td>
                    <fmt:message key="작성자" />
                </td>
                <td>
                    <fmt:message key="작성일" />
                </td>
            </tr>
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
                     ${board.userNo}

                </td>
                <td>
                    ${board.artTitle}
                </td>
                <td>
                    ${board.artBody}
                </td>
            </tr>
            </c:forEach>
        </table>
    </section>
</layout:main>
