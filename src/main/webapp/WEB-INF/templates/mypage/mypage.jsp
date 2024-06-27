<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<fmt:setBundle basename="messages.commons" />
<fmt:message var="pageTitle" key="마이페이지" />
<c:url var="actionUrl" value="/mypage/mypage" />

<layout:main title="${pageTitle}">
    <div class="content-box">
        <h1>${pageTitle}</h1>
            <form id="mypage-form" action="" method="post">
                <table>
                    <tr>
                        <td>이메일</td>
                        <td>
                            <input type="text"
                                   name="userId"
                                   maxlength="12"
                                   readonly
                                   value="user01@test.org">
                        </td>
                    </tr>
                    <tr>
                        <td>비밀번호</td>
                        <td>
                            <input type="text"
                                   name="userPw"
                                   maxlength="15"
                                   value="">
                        </td>
                    </tr>
                    <tr>
                        <td>비밀번호 확인</td>
                        <td>
                            <input type="text"
                                   name="userPw"
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
                            value="사용자01">
                      </td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>전화번호</td>
                      <td>
                          <input type="text"
                                 name="phone"
                                 placeholder="xxx-xxxx-xxxx"
                                 value="010-1234-1234">
                      </td>
                      <td></td>
                    </tr>
                </table>

                <br><br>

                <div align="center">
                    <button type="submit">수정</button>
                    <button type="button">회원탈퇴</button>
                  </div>
            </form>
    </div>
    <div class="content-box">
        <h1>나의 띠부씰</h1>
    </div>
</layout:main>