<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<fmt:setBundle basename="messages.commons" />
<fmt:message var="pageTitle" key="마이페이지" />
<c:url var="actionUrl" value="/mypage/mypage" />

<layout:main title="${pageTitle}">
    <div class="content-box3">
        <h1>${pageTitle}</h1>
            <form id="frmMypage" name="frmMypage" method="POST" action="${actionUrl}" target="ifrmProcess" autocomplete="off">
                <table>
                    <tr>
                        <td>이메일</td>
                        <td>${loggedMember.email}</td>
                    </tr>
                    <tr>
                        <td>비밀번호</td>
                        <td>
                            <input type="password"
                                   name="password"
                                   placeholder="비밀번호를 입력해주세요."
                                   maxlength="15"
                                   value="">
                        </td>
                    </tr>
                    <tr>
                        <td>비밀번호 확인</td>
                        <td>
                            <input type="text"
                                   name="confirmPassword"
                                   placeholder="비밀번호 확인"
                                   maxlength="15"
                                   value="">
                        </td>
                    </tr>
                    <tr>
                        <td>이름</td>
                        <td>
                            <input type="text"
                            name="userName"
                            maxlength="15"
                            required
                            value="${loggedMember.userName}">
                      </td>
                    </tr>
                    <tr>
                        <td>회원 구분</td>
                        <td>${loggedMember.userType}</td>
                    </tr>
                </table>

                <br><br>

                <div align="center">
                    <button type="submit" class="modifybutton">수정</button>
                    <button type="button" class="unregisterbutton">회원탈퇴</button>
                  </div>
            </form>
    </div>
    <div class="content-box3">
        <h1>나의 띠부씰</h1>
    </div>
</layout:main>