<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.diary.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	DiaryCalendar myCalendar = DiaryCalendar.getInstance();
	int year = myCalendar.getCurrentYear();
	int month = myCalendar.getCurrentMonth();
	request.setAttribute("year", year);
	request.setAttribute("month", month);
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>일정</title>
<style type="text/css">
	iframe{
		width:100%;
		height:100%; 				 						
	}
</style>
<script type="text/javascript">
	function refreshCalendar(){
		var select_year = document.getElementById("year");
		var select_month = document.getElementById("month");
		var year = select_year.options[select_year.selectedIndex].value;
		var month = select_month.options[select_month.selectedIndex].value;
		calendar.location="../diary/calendar.jsp?year="+year+"&month="+month;	
	}
</script>
</head>
<body>
	<center>
		<!-- 달력 부분 -->
		<table width=80% height=540 cellspacing=0 cellpadding=0 border=1>
			<tr>
				<th colspan=2 valign="middle" bgcolor="#ccccff">
					<select id=year onchange='refreshCalendar()'>
						<c:forEach var="i" begin="${year-50 }" end="${year+50 }" step="1">
							<option${i==year?" selected":" "}>${i }</option>							
						</c:forEach>
					</select>
					년&nbsp;&nbsp;					
					<select id=month onchange='refreshCalendar()'>						
						<c:forEach var="i" begin="1" end="12" step="1">
							<option${i==month?" selected":" " }>${i }</option>
						</c:forEach>
					</select>					
					월&nbsp;&nbsp;
					일정표
				</th>
			</tr>
			<tr>	
				<td width=100% height=90%>
				<iframe marginwidth=0 marginheight=0 src="../diary/calendar.jsp?year=<%=year%>&month=<%=month%>" id="calendar">		
					<!-- 달력 출력 부분 -->
				</iframe>															
				</td>
			</tr>
		</table>
	</center>
</body>
</html>