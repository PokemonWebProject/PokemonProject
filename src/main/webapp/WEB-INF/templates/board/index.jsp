<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<fmt:setBuntre basename="messages.commons" />
<fmt:message var="pageTitle" key='게시글목록' />
<c:url var="actionUrl" value="" />
<layout:main title="${pageTitle}">
    <section class="content-box">
        <h1>${pageTitle} ${member.userNo}</h1>
        <table>
            <tr>
                <td>
                    <fmt:message key="제목" />
                </td>
                <td>
                    <input type="text" name="artTitle">

                </td>
            </tr>
            <tr>
                <td>
                    <fmt:message key="작성자" />
                </td>
                <td>
                    <input type="text" name="userName" value="${member.userName}" readonly>
                </td>
            </tr>
            <tr>
                <td>
                    <fmt:message key="본문" />
                </td>
                <td>
                    <textarea name="artBody"  rows="4" cols="50"></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <fmt:message key="첨부파일"/>
                </td>
                <td>
                    <input type="file" name="file"><br>
                </td>

            </tr>
            <div class="button-group">
                <button type="reset">
                    <fmt:message key="다시입력" />
                </button>
                <button type="submit">
                    <fmt:message key="작성하기" />
                </button>
            </div>

        </table>
    </section>
</layout:main>
