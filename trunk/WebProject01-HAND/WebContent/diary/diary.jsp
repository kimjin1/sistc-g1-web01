<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.diary.*" %>    
<jsp:useBean id="myCalendar" class="com.diary.DiaryCalendar"></jsp:useBean>
<%
	int year;
	int month;
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	if(strYear == null && strMonth == null){
		year = myCalendar.getCurrentYear();
		month = myCalendar.getCurrentMonth();
	}else{		
		year = Integer.parseInt(strYear);
		month = Integer.parseInt(strMonth);
	}
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>일정</title>
<script type="text/javascript">
	function refreshCalendar(){
		
	}
</script>
</head>
<body>
	<center>
		<!-- 달력 부분 -->
		<table width=100% height=700 border=1>
			<tr>
				<th colspan=2 height=10%>
				<%--
				<%=year%>년&nbsp;<%=month%>월&nbsp;달력
				 --%>
					<select name=selyear>
						<%
						for(int i=year-100; i<year+100; i++){
							String output = "";
							if(i==year){
								output += "<option selected>"+i+"</option>";
							}else{
								output += "<option>"+i+"</option>";
							}
							out.println(output);
						}
						%>	
					</select>
					년&nbsp;&nbsp;					
					<select name=selmonth>
						<%
						for(int i=1; i<=12; i++){							
							String output = "";
							if(i==month){
								output += "<option selected>"+i+"</option>";
							}else{
								output += "<option>"+i+"</option>";
							}
							out.println(output);
						}
						%>						
					</select>
					월&nbsp;&nbsp;
					일정표
				</th>
			</tr>
			<tr>	
				<td width=80% height=90%>										 
					<jsp:include page="../diary/calendar.jsp">
						<jsp:param value="<%=year%>" name="year"/>
						<jsp:param value="<%=month%>" name="month"/>
					</jsp:include>														
				</td>
				<td width=20% height=90%>
					<jsp:include page="../diary/eventlist.jsp"/>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>