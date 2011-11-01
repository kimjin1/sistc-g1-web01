<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
        <%
		session.invalidate();//세션에 등록된 모든 정보를 지운다
		//response.sendRedirect("../login/login.jsp");
		%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function refreshIndex(){
	parent.location.href = "../index.jsp?type=1";
}
</script>
</head>
<body onload="refreshIndex()">

</body>
</html>		