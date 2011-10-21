<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	String strDay = request.getParameter("day");
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%=strYear%>&nbsp;&nbsp;<%=strMonth%>&nbsp;&nbsp;<%=strDay%>일정입니다
</body>
</html>