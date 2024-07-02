<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>

<layout:main title="나의 띠부씰">
    <section class="layout-width">
        <div class="content-box3">
            <h2>나의 띠부씰</h2>
            <dl>
                <dd>
            	    <c:if test="${myProfile != null}">
                        <div class='profile'>
                           <img src="${myProfile.frontImage}" alt="${myProfile.nameKr}">
                            <div>${myProfile.nameKr}</div>
                        </div>
                    </c:if>
                </dd>
            </dl>
        <div class='button-group'>
        <button type="reset">다시입력</button>
        <button type="submit">수정하기</button>
        </div>
        </div>
    </section>
</layout:main>