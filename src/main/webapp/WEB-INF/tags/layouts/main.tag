<%@ tag body-content="scriptless" %>
<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/utils" %>
<%@ attribute name="title" %>
<%@ attribute name="side" fragment="true" %>
<fmt:setBundle basename="messages.commons" />
<c:url var="cssUrl" value="/css/" />
<c:url var="jsUrl" value="/js/" />
<c:url var="homeUrl" value="/" />
<c:url var="searchUrl" value="/board/search" />
<c:url var="logoUrl" value="/images/logo3.png" />
<c:url var="logoUrl2" value="/images/logo2.png" />
<c:url var="profileUrl" value="/images/profileimg.png" />

<layout:common title="${title}">
    <jsp:attribute name="header">
        <section class="logo-profile">
            <a href="${homeUrl}" class='logo'>
                <img src="${logoUrl}" alt="<fmt:message key='로고' />">
            </a>
             <div class="profile">
            <util:guestOnly>
                <div class='profile-text guest'>
                    <div>
                        <a href="<c:url value='/member/join' />">
                            <i class="xi-user-plus-o"></i>
                            <fmt:message key="회원가입" />
                        </a>
                        <a href="<c:url value='/member/login' />">
                            <i class="xi-log-in"></i>
                            <fmt:message key="로그인" />
                        </a>
                    </div>
                </div>
            </util:guestOnly>
            <util:memberOnly>
                    <c:if test="${myProfile != null}">
                        <img class="profile-img" src="${myProfile.frontImage}" >
                    </c:if>
                    <div class='profile-text'>
                       <div class="logintext">
                            <fmt:message key="LOGIN_MSG">
                                <fmt:param>${loggedMember.userName}</fmt:param>
                            </fmt:message>
                       </div>
                       <br>
                        <a href="<c:url value='/mypage' />">
                            <fmt:message key="마이페이지"/>
                        </a>
                        <a href="<c:url value='/member/logout' />">
                            <fmt:message key="로그아웃"/>
                        </a>
                        <util:adminOnly>
                            <a href="<c:url value='/admin/member/list' />" target="_blank">
                                <fmt:message key="사이트_관리" />
                                <i class="xi-lock"></i>
                            </a>
                        </util:adminOnly>
                    </div>
           </util:memberOnly>
           </div>
        </section>
        <nav>
            <div class="layout-width inner">
                <a href="<c:url value='/board' />" target="_self">
                자유게시판
                </a>
                <a href="<c:url value='/pokemon' />" target="_self">
                포켓몬 도감
                </a>
                <a href="<c:url value='/pick' />" target="_self">
                포켓몬 뽑기
                </a>
                <a href="https://pokerogue.net" target="_blank">
                포켓몬 게임
                </a>
            </div>
        </nav>
    </jsp:attribute>

    <jsp:attribute name="footer">
        <div class='layout-width'>
            <div class="footer_logo"><img src="${logoUrl2}" alt="로고"></div>
            <div class='footer_r'>
                <div class='footer_wrap'>
                    <div class="footer_left">
                        <ul>
                            <li><a href="https://github.com/GroupStudy502/Project_WebPage">Team502 &nbsp;&nbsp;&nbsp;|</a></li>
                            <li><a href="https://github.com/0taelove">&nbsp;&nbsp;Otaelove &nbsp;&nbsp;&nbsp;|</a></li>
                            <li><a href="https://github.com/hjchoirr">&nbsp;&nbsp;hjchoirr &nbsp;&nbsp;&nbsp;|</a></li>
                            <li><a href="https://github.com/jek730">jek730 &nbsp;&nbsp;&nbsp;|</a></li>
                            <li><a href="https://github.com/decl5th">decl5th &nbsp;&nbsp;&nbsp;|</a></li>
                            <li><a href="https://github.com/sswum">sswum &nbsp;&nbsp;&nbsp;|</a></li>
                            <li><a href="https://github.com/lionjeongin">lionjeongin</a></li>
                        </ul>

                    </div>
                    <div class="footer_right">
                        <div class="sns">
                            <ul>
                            <li><a href="https://www.facebook.com/PokemonCoKr"><img src="<c:url value='/images/icon_faceb.png' />" alt="facebook 이미지"></a></li>
                            <li><a href="https://www.instagram.com/pokemon_korea_official/?igshid=OGQ5ZDc2ODk2ZA%3D%3D"><img src="<c:url value='/images/icon_insta.png' />" alt="instagram 이미지"></a></li>
                            <li><a href="https://www.youtube.com/user/PokemonKoreaInc"><img src="<c:url value='/images/icon_youtube.png' />" alt="youtube 이미지"></a></li>
                            <li><a href="https://www.pokemonstore.co.kr/"><img src="<c:url value='/images/icon_pokemon.png' />" alt="pokemon 이미지"></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="copyText">
                <p class="copy">This Pokémon encyclopedia project was created by GroupStudy502.</p>
                <p class="copy">Developed in Room 502, 5th Floor, at the Choongang Academy.</p>
                <p class="copy">Stay tuned for more updates and features!</p>
                <p class="copy"><br>&copy; 2024 포켓몬 도감 Project_WebPage. All right reserved.</p>
                <p class="copy">Visit our team&apos;s GitHub repository for our latest projects and contributions.</p>
                </div>
            </div>
    </jsp:attribute>
    <jsp:attribute name="commonCss">
        <link rel="stylesheet" type="text/css" href="${cssUrl}main.css">
    </jsp:attribute>
    <jsp:attribute name="commonJs">
        <script src="${jsUrl}main.js"></script>
    </jsp:attribute>
    <jsp:body>
        <jsp:invoke fragment="side" />
        <jsp:doBody />
    </jsp:body>
</layout:common>