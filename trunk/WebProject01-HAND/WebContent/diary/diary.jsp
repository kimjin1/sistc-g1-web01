<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.diary.*" %>    
<jsp:useBean id="myCalendar" class="com.diary.DiaryCalendar"></jsp:useBean>
<%
	int year = myCalendar.getCurrentYear();
	int month = myCalendar.getCurrentMonth();
	// �迭�� ù��°���� ����������, �ι�° ���� �������� DAY_OF_WEEK
	int today[] = myCalendar.todayCalendar(year, month);
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����</title>
</head>
<body>
	<center>
		<!-- �޷� �κ� -->
		<table width=100% height=600 border=1>
			<tr>
				<th colspan=2 height=10%><%=year%>��&nbsp;<%=month%>��&nbsp;�޷�</th>
			</tr>
			<tr>	
				<td width=80% height=90%>
					<table width=100% height=100% border=1>
					<%
						for(int i=0; i<6; i++){
						%>
							<tr>	
						<%
							for(int j=0; j<7; j++){
							%>
								<td>1</td>
							<%
							}
						%>
							</tr>
						<%
						}
					%>
					</table>
				</td>
				<td width=20% height=90%>
					&nbsp;
				</td>
			</tr>
		</table>
	</center>
</body>
</html>