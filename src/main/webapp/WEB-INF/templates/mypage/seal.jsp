<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>

<layout:main title="나의 띠부씰">
    <jsp:attribute name="side">
        <jsp:include page="_side.jsp" />
    </jsp:attribute>

    <jsp:body>
        <section class="content-box3">
            <div class="inner">
                <h1>나의 띠부씰</h1>
                <jsp:include page="_my_pokemon.jsp" />
            </div>
        </section>
    </jsp:body>
</layout:main>