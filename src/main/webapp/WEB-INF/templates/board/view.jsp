
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
                    <textarea name="artBody"  rows="4" cols="50" readonly>${board.artBody}</textarea>
                </td>
            </tr>
            <tr>
                <th>
                    <fmt:message key="첨부파일"/>
                </th>
                <td>
                    ${board.fileName}
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
                    <a href="${saveUrl}/${board.artNo}">
                        <fmt:message key="수정하기" />
                    </a>
                </div>
                <div class="boardButton">
                    <a href="${deleteUrl}/${board.artNo}">
                        <fmt:message key="삭제하기" />
                    </a>
                </div>
            </div>
        </form>
    </section>
</layout:main>