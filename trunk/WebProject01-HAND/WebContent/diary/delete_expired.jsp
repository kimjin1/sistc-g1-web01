<%@page import="com.db.DiaryDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	// 지난 일정 삭제
	DiaryDAO dao = DiaryDAO.getInstance();
	dao.deleteExpired();
	response.sendRedirect("../diary/diary.jsp");
%>
</body>
</html>