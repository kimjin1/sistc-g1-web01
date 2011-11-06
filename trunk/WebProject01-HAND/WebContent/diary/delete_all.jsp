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
	// 리스트로 복귀할때 다시 넘겨줄 년월일 날짜를 받는다
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	
	DiaryDAO dao = DiaryDAO.getInstance();
	// 선택된 일정들을 배열로 받아 삭제
	String checked[] = request.getParameterValues("chklist");	
	dao.deleteEvent(checked);			
	
	// 실행 완료후 일정목록으로 보낸다 
	response.sendRedirect("../diary/event_list.jsp?year="+year+"&month="+month+"&day="+day);
%>
</body>
</html>