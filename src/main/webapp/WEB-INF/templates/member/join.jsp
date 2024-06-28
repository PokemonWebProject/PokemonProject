<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<fmt:setBundle basename="messages.commons" />
<fmt:message var="pageTitle" key='회원가입' />
<c:url var="actionUrl" value="/member/join" />
<c:url var="logoUrl" value="/images/pikachu.png" />
<c:url var="iconUrl" value="/images/icon_pika.png" />
<c:url var="mouseUrl" value="/images/ic_mouse.png" />

<layout:main title="${pageTitle}">
    <section class="content-box2">
        <img src="${logoUrl}"/>
        <h1>${pageTitle}</h1>
        <form id="frmJoin" name="frmJoin" method="POST" action="${actionUrl}" autocomplete="off" target="ifrmProcess">

            <input type="text" name="email" placeholder='<fmt:message key="이메일" />' class='input-txt'>

            <input type="password" name="password" placeholder='<fmt:message key="비밀번호" />' class='input-txt'>

            <input type="password" name="confirmPassword" placeholder='<fmt:message key="비밀번호_확인" />' class='input-txt'>

            <input type="text" name="userName" placeholder='<fmt:message key="회원명" />' class='input-txt'>

            <div class="terms">
                <div class="tit">
                    <fmt:message key="약관_동의" />
                </div>
                    <div class="termsContent">
                        <img src="${iconUrl}" alt="-" class="icon">
                        <span>서비스 이용 약관에 동의합니다.</span>
                    </div>
                    <div class="termsContent">
                        <img src="${iconUrl}" alt="-" class="icon">
                        <span>개인정보 처리 방침에 동의합니다.</span>
                    </div>
                    <div class="termsContent">
                        <img src="${iconUrl}" alt="-" class="icon">
                        <span>이메일, SMS 등 마케팅 광고 수신에 동의합니다.</span>
                    </div>
                </div>
                <input type="checkbox" name="termsAgree" value="true" id="termsAgree">
                <label for="termsAgree">
                    <fmt:message key="약관에_동의합니다." />
                </label>
            </div>
            <div class="button-group">
                <button type="reset" class="resetbutton">
                    <fmt:message key="다시입력" />
                </button>
                <button type="submit" class="submitbutton">
                    <fmt:message key="가입하기" />
                </button>
            </div>
        </form>
    </section>
    <img id="follow-image" class="follow-image" src="${mouseUrl}" alt="Follow Icon">
</layout:main>