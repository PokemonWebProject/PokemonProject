
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<c:url var="actionUrl" value="/board/save" />
<c:url var="loginUrl" value="/member/login" />
<c:url var="listUrl" value="/board/list" />
<c:url var="saveUrl" value="/board/save" />
<c:url var="deleteUrl" value="/board/delete" />
<fmt:setBundle basename="messages.commons" />

<c:if test="${!empty board.artNo}">
    <fmt:message var="pageTitle" key='게시글_보기' />
</c:if>

<layout:main title="${pageTitle}">
    <section class="board-box">
        <h1>${pageTitle}</h1>
        <table class="table-cols">
            <tr>
                <th>
                    <fmt:message key="번호" />
                </th>
                <td>
                        ${board.artNo}

                </td>
            </tr>
            <tr>
                <th>
                    <fmt:message key="제목" />
                </th>
                <td>
                    ${board.artTitle}

                </td>
            </tr>
            <tr>
                <th>
                    <fmt:message key="작성자" />
                </th>
                <td>
                    ${board.userName}
                </td>
            </tr>
            <tr>
                <th>
                    <fmt:message key="본문" />
                </th>
                <td>
                    <div class="artbody">
                    ${board.artBody}
                    </div>
                </td>
            </tr>
            <tr>
                <th>
                    <fmt:message key="첨부파일"/>
                </th>
                <td>
                    <c:if test="${board.attachFiles != null && !board.attachFiles.isEmpty()}">
                        <ul class="download-items">
                            <c:forEach var="item" items="${board.attachFiles}" varStatus="status">
                                <li>
                                    ${status.count})
                                    <a href="<c:url value='/file/download' />/${item.seq}">
                                            ${item.fileName}
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:if>
                </td>

            </tr>
            </table>
            <div class="board-button-group">
                <div class="boardButton">
                    <a href="${listUrl}">
                        <fmt:message key="목록보기" />
                    </a>
                </div>
                <div class="boardButton">
                    <c:if test="${member.userNo!=board.userNo}" >
                        <a href="#" onclick="alert('작성자만 수정할 수 있습니다');">
                            <fmt:message key="수정하기" />
                        </a>
                    </c:if>
                    <c:if test="${member.userNo==board.userNo}" >
                        <a href="${saveUrl}/${board.artNo}">
                            <fmt:message key="수정하기" />
                        </a>
                    </c:if>
                </div>
                <div class="boardButton">
                    <c:if test="${member.userNo==board.userNo}" >
                        <a href="${deleteUrl}/${board.artNo}" onclick="return confirm('게시글을 정말 삭제하시겠습니까')">
                        <fmt:message key="삭제하기" />
                        </a>
                    </c:if>
                    <c:if test="${member.userNo!=board.userNo}" >
                        <a href="#" onclick="alert('작성자만 삭제할 수 있습니다');">
                            <fmt:message key="삭제하기" />
                        </a>
                    </c:if>
                </div>
            </div>
        </form>
    </section>
</layout:main>