<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.diary.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	// 달력 관련 기능을 모아놓은 DiaryCalendar 클래스로부터 현재 연도와 월을 얻어온다
	DiaryCalendar myCalendar = DiaryCalendar.getInstance();
	int year = myCalendar.getCurrentYear();
	int month = myCalendar.getCurrentMonth();
	// EL사용을 위해 년, 월값을 저장
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
	// 연도와 월 선택부분과 하단 달력 출력 부분을 분리, 연도 및 월 변경시 전체 화면 갱신 없이 달력 부분만 변경한다
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
		<table border=0 width=100%>		
			<tr>			
			<td width=5%>
				<%-- 달력 측면에 연도 표시. 최종본에서 사용 안함
				<table border=0>
				<tr>
					<td>△</td><td>▽</td>
				</tr>
				<tr>
				<td colspan=2>			
				<select id=year onchange='refreshCalendar()'>
					<c:forEach var="i" begin="${year-50 }" end="${year+50 }" step="1">
						<option${i==year?" selected":" "}>${i }</option>							
					</c:forEach>
				</select>			
				</td>
				</tr>				
				<tr><td colspan=2>년</td></tr>				
				</table>
				--%>							
			</td>
			<td width=90%>
		<table width=100% height=400 cellspacing=0 cellpadding=0 border=0>
			<tr>
				
				<th colspan=2 valign="middle" bgcolor="C2C2C2">
					<%-- 현재 연도 기준 -50 ~ +50까지 출력. 현재 연도는 기본 선택 --%>
					<select id=year onchange='refreshCalendar()'>
						<c:forEach var="i" begin="${year-50 }" end="${year+50 }" step="1">
							<option${i==year?" selected":" "}>${i }</option>							
						</c:forEach>
					</select>
					년&nbsp;&nbsp;
					<%-- 1~12월 까지 출력 --%>					
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
				<%-- 실제 달력 출력부분은 iframe으로 분리 (변경시 부분만 갱신하기 위함) --%>
				<iframe frameborder="0" marginwidth=0 marginheight=0 src="../diary/calendar.jsp?year=<%=year%>&month=<%=month%>" id="calendar">		
					<!-- 달력 출력 부분 -->
				</iframe>															
				</td>
			</tr>
		</table>
			</td>
			<td width=5%>
				<%-- 달력 측면에 월 표시. 최종본에서 사용 안함
				<table border=0>
				<tr>
					<td>△</td><td>▽</td>
				</tr>
				<tr>
				<td colspan=2>
				<select id=month onchange='refreshCalendar()' >						
					<c:forEach var="i" begin="1" end="12" step="1">
						<option${i==month?" selected":" " }>&nbsp;&nbsp;${i }</option>
					</c:forEach>
				</select>
				</td>
				</tr>				
				<tr><td colspan=2>월</td></tr>				
				</table>
				--%>			
			</td>
			</tr>
		</table>
	</center>
</body>
</html>