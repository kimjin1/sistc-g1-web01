<%@page import="com.diary.DiaryCalendar"%>
<%@page import="com.db.DiaryDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*, java.util.*"%>
<% 
	DiaryDAO dao = DiaryDAO.getInstance();
	DiaryVO dVO = new DiaryVO();
	String id = (String)session.getAttribute("id");
			
	dVO.setId(id);
	dVO.setSubject(request.getParameter("subject"));
	dVO.setContent(request.getParameter("content"));
	DiaryCalendar myCal = DiaryCalendar.getInstance();
	int ymdhm[] = {
		Integer.parseInt(request.getParameter("year")),
		Integer.parseInt(request.getParameter("month")),
		Integer.parseInt(request.getParameter("day")),
		Integer.parseInt(request.getParameter("hour")),
		Integer.parseInt(request.getParameter("minute")),
	};	
	Date event_time = myCal.valueToDate(ymdhm);
	dVO.setEvent_time(event_time);
	dao.insertEvent(dVO);
%>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%response.sendRedirect("../diary/event_list.jsp"); %>
</body>
</html>