<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>


<layout:admin title="관리자페이지!">

<h1>★관리자 페이지에 오신 걸 환영합니다~~</h1>

<!DOCTYPE html>

<body>
    <script language="JavaScript">
        expireDate = new Date
        expireDate.setMonth(expireDate.getMonth()+3)
        hitCt = eval(cookieVal("pageHit"))
        hitCt++  // 방문 카운트 +1
        document.cookie = "pageHit="+hitCt+";expires=" + expireDate.toGMTString()
        function cookieVal(cookieName) {
           thisCookie = document.cookie.split("; ")
           for (i=0; i<thisCookie.length; i++) {
                if (cookieName == thisCookie[i].split("=")[0]) {
                     return thisCookie[i].split("=")[1]
               }
         }
         return 0
        }
        </script>
<h3 align=center>
<script language="javascript" type="text/javascript">
    document.write("현재 홈페이지에 <font color=red>" + hitCt + "</font> 번째 방문자입니다!")
</script>
</h3>
</body>
</html>

</layout:admin>