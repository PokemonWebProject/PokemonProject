
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<c:url var="actionUrl" value="/board/save" />
<c:url var="loginUrl" value="/member/login" />
<fmt:setBundle basename="messages.commons" />
<c:if test="${empty board.artNo}">
    <fmt:message var="pageTitle" key='게시글_등록' />
</c:if>
<c:if test="${!empty board.artNo}">
    <fmt:message var="pageTitle" key='게시글_수정' />
</c:if>

<layout:main title="${pageTitle}">
    <section class="board-box">
        <h1>${pageTitle}</h1>
        <form name="frmSave" method="post" action="${actionUrl}" autocomplete="off" target="ifrmProcess">
            <c:if test="${empty board.artNo}">
                <input type="hidden" name="gid" value="${gid}">
            </c:if>
            <c:if test="${!empty board.artNo}">
                <input type="hidden" name="gid" value="${board.gid}">
            </c:if>

            <table class="table-cols">
            <tr>
                <th>
                    <fmt:message key="제목" />
                </th>
                <td>
                    <input type="text" name="artTitle" value="${board.artTitle}">

                </td>
            </tr>
            <tr>
                <th>
                    <fmt:message key="작성자" />
                </th>
                <td>
                    <input type="text" name="userName" value="${member.userName}" readonly>
                </td>
            </tr>
            <tr>
                <th>
                    <fmt:message key="본문" />
                </th>
                <td>
                    <textarea name="artBody" id="artBody" rows="4" cols="50">${board.artBody}</textarea>
                </td>
            </tr>
            <tr>
                <th>
                    <fmt:message key="첨부파일"/>
                </th>
                <td>
                    <!--<input type="file" name="file"><br>-->
                    <button type="button" class="file-upload">파일선택</button>
                    <div class="attach-files" id="attach-files-attach"></div>
                </td>
                <jsp:include page="../commons/_file_tpl.jsp" />

            </tr>
            </table>
            <div class="table-cols button-group">
                <button type="reset">
                    <fmt:message key="다시입력" />
                </button>
                <button type="submit">
                        <fmt:message key='저장하기' />
                </button>

            </div>
            <input type="hidden" name="artNo" value="${board.artNo}">
            <input type="hidden" name="userNo" value="${member.userNo}">
        </form>
    </section>
</layout:main>