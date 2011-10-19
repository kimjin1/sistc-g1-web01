<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.diary.*" %>    
<jsp:useBean id="myCalendar" class="com.diary.DiaryCalendar"></jsp:useBean>
<%
	int year = myCalendar.getCurrentYear();
	int month = myCalendar.getCurrentMonth();
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>일정</title>
</head>
<body>
	<center>
		<!-- 달력 부분 -->
		<table width=100% height=600 border=1>
			<tr>
				<th colspan=2 height=10%><%=year%>년&nbsp;<%=month%>월&nbsp;달력</th>
			</tr>
			<tr>	
				<td width=80% height=90%>					 
					<jsp:forward page="/CalendarServlet">
						<jsp:param value='<%=year%>' name="year"/>
						<jsp:param value='<%=month%>' name="month"/>
					</jsp:forward>					 					
				</td>
				<td width=20% height=90%>
					&nbsp;
				</td>
			</tr>
		</table>
	</center>
</body>
</html>