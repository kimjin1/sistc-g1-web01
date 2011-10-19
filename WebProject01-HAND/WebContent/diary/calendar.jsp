<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.diary.*"%>
<%
	
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	String[] week = {"일", "월", "화", "수", "목", "금", "토"}; 
	int year = Integer.parseInt(strYear);
	int month = Integer.parseInt(strMonth);
	
	DiaryCalendar myDC = new DiaryCalendar();	
	int result[] = myDC.todayCalendar(year, month);
	int startDate = 1;
	int endDate = result[0];
	int offset = result[1];
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<table width=100% height=100%>
			<tr>

			<%
			for(int i=0; i<7; i++){
			%>
				<th bgcolor=#ccccff>
				<%
				if(i==0){
				%>
					<font color=red><%=week[i]%></font>	
				<%
				}else if(i==6){
				%>
					<font color=blue><%=week[i]%></font>
				<%	
				}else{
				%>		
					<%=week[i]%>									
				<%
				}
				%>				
				</th>
			<%	
			}
			%>
			<%
			for(int i=0; i<6; i++){
			%>
				<tr>
			<%	
				for(int j=0; j<7; j++){
				%>
					<td>
					<%
					if(i==0 && i<offset-1){
					%>
						&nbsp;
					<%	
					}else if(startDate <= endDate){
					%>
						<%=startDate%>
					<%	
					}else{
					%>
						&nbsp;
					<%	
					}
					%>
					</td>
				<%	
				}
			%>
				</tr>
			<%	
			}
			%>				
		</table>
	</center>					 				
</body>
</html>