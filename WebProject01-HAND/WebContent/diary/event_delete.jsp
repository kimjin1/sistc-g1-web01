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
	// 개별 일정 삭제
	int no = Integer.parseInt(request.getParameter("no"));
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	DiaryDAO dao = DiaryDAO.getInstance();
	//System.out.println(year+":"+month+":"+day+":"+no);
	dao.deleteEvent(no);
	response.sendRedirect("../diary/event_list.jsp?year="+year+"&month="+month+"&day="+day);
%>
</body>
</html>