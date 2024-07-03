<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>

<layout:mypage title="나의 띠부씰">
    <section class="content-box3">
        <h2>나의 띠부씰</h2>
        <jsp:include page="_my_pokemon.jsp" />
    </section>
</layout:mypage>