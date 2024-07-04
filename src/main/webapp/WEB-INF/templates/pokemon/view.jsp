<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<%@ taglib prefix="pk" tagdir="/WEB-INF/tags/pokemon" %>
<layout:main title="${data.nameKr}(${data.name})">
    <section class="pokemon-view">
        <div class="pokemon-container">
            <div class="pokemon-image">
                <img src="${data.frontImage}" alt="프론트">
            </div>
            <div class="pokemon-details">
                <div class="pd-seq">
                    No.000${data.seq}
                </div>
                <div class="pd-name">
                    ${data.nameKr}
                </div>
                <div class="p-desc">
                    ${fn:replace(data.description, '\\n', '<br>')}
                </div>
                <div class="pokemon-info">
                    <div class="pd-info-block">
                        <div class="pd-info-header">타입</div>
                        <div class="pd-info-content">
                            <div class="type-images">
                                <pk:typeImg value="${data.types1}" />
                                <pk:typeImg value="${data.types2}" />
                            </div>
                            <div class="type-texts">
                                <span>${data.types1}</span>
                                <span>${data.types2}</span>
                            </div>
                        </div>
                    </div>
                    <div class="pd-info-block">
                        <div class="pd-info-header">키</div>
                        <div class="pd-info-content">
                            <span>${String.format("%.1f", data.height * 0.1)}m</span>
                        </div>
                    </div>
                    <div class="pd-info-block">
                        <div class="pd-info-header">몸무게</div>
                        <div class="pd-info-content">
                            <span>${String.format("%.1f", data.weight * 0.1)}kg</span>
                        </div>
                    </div>
                </div>
                <a href="<c:url value='/pokemon' />"><button type="button" class="pokemon-button">포켓몬 목록</button></a>
            </div>
        </div>
        <br><br>
    </section>
</layout:main>
