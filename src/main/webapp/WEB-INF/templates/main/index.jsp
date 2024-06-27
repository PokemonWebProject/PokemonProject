<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/utils" %>
<c:url var="homeUrl" value="/" />
<c:url var="backimgUrl" value="/images/backimg.jpg" />

<layout:main>
   <section class="content-box">
        <util:memberOnly>

        </util:memberOnly>
        <util:guestOnly>

        </util:guestOnly>
   </section>
</layout:main>