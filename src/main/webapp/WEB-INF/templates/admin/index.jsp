<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">

<layout:admin title="관리자페이지!">

<h1>

<div class="visitor">
     <span>관</span>
     <span>리</span>
     <span>자</span>
     <span>페</span>
     <span>이</span>
     <span>지</span>
     <span>에</span>
     <span>오</span>
     <span>신</span>
     <span>걸</span>
     <span>환</span>
     <span>영</span>
     <span>합</span>
     <span>니</span>
     <span>다</span>
     <br>
     <br>
    <span>오</span>
    <span>늘</span>
    <span>의</span>
    <span>방</span>
    <span>문</span>
    <span>자</span>
    <span>는</span>
    <span>총</span>
    <span><fmt:formatNumber value="${loginCount}" /></span>
    <span>명</span>
    <span>입</span>
    <span>니</span>
    <span>다. </span>


</h1>
</layout:admin>