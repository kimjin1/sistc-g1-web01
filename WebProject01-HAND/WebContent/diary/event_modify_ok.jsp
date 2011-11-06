<%@page import="com.diary.DiaryCalendar"%>
<%@page import="com.db.DiaryDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*, java.util.*"%>
<%	
	request.setCharacterEncoding("euc-kr");
	DiaryDAO dao = DiaryDAO.getInstance();
	DiaryVO dVO = new DiaryVO();
	
	String id = (String)session.getAttribute("id");
	
	String no = request.getParameter("no");
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	String strDay = request.getParameter("day");
	String strHour = request.getParameter("hour");
	String strMinute = request.getParameter("minute");
	
	DiaryCalendar myCal = DiaryCalendar.getInstance();
	int ymdhm[] = {
		Integer.parseInt(strYear),
		Integer.parseInt(strMonth),
		Integer.parseInt(strDay),
		Integer.parseInt(strHour),
		Integer.parseInt(strMinute),
	};
	
	dVO.setNo(Integer.parseInt(no));
	dVO.setId(id);	
	dVO.setSubject(request.getParameter("subject"));
	dVO.setContent(request.getParameter("content"));	
	// 년,월,일,시,분 정보를 받아 Date타입으로 반환
	Date event_time = myCal.valueToDate(ymdhm);
	dVO.setEvent_time(event_time);
	dao.modifyEvent(dVO);
%>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function refreshParent(){
	parent.location.href="../diary/calendar.jsp";
}
</script>
</head>
<body onload="refreshParent()">
	<%		
		String ymd = "?year="+strYear+"&month="+strMonth+"&day="+strDay; 
		response.sendRedirect("../diary/event_list.jsp"+ymd); 
	%>
</body>
</html>