<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<c:url var="actionUrl" value="/mypage/info" />

<layout:main title="회원정보 수정">
    <section class="layout-width">
        <div class="content-box3">
            <h2>회원정보 수정</h2>
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
                                       value="">
                            </td>
                        </tr>
                        <tr>
                            <td>비밀번호 확인</td>
                            <td>
                                <input type="password"
                                       name="confirmPassword"
                                       placeholder="비밀번호 확인"
                                       value="">
                            </td>
                        </tr>
                        <tr>
                            <td>이름</td>
                            <td>
                                <input type="text"
                                name="userName"
                                value="${loggedMember.userName}">
                          </td>
                        </tr>
                        <tr>
                            <td>회원 구분</td>
                            <td>${loggedMember.userType.title}</td>
                        </tr>
                    </table>

                    <br><br>

                    <div align="center">
                        <button type="submit" class="modifybutton">수정</button>
                      </div>
                </form>
        </div>
    </section>
</layout:main>