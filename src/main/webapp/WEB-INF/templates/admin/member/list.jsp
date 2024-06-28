<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<layout:admin title="회원 목록">
<h1>회원 목록</h1>

<table>
        <tr>
            <th scope="col">번호</th>
            <th scope="col">제목</th>
            <th scope="col" colspan="2">이름</th>
            <!-- <th scope="col">조회수</th> : 밀려난 셀 제거-->
        </tr>
        <tr>
            <td rowspan="3">1</td>
            <td>테이블-1</td>
            <td>홍길동</td>
            <td>10</td>
        </tr>
        <tr>
            <!-- <td>2</td> -->
            <td>테이블-2</td>
            <td>둘리</td>
            <td>20</td>
        </tr>
        <tr>
            <!-- <td>3</td> -->
            <td>테이블-3</td>
            <td>도우너</td>
            <td>30</td>
        </tr>
</table>

</layout:admin>