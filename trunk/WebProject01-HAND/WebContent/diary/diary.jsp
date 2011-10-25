<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.diary.*" %>    
<%
	DiaryCalendar myCalendar = DiaryCalendar.getInstance();
	int year = myCalendar.getCurrentYear();
	int month = myCalendar.getCurrentMonth();
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����</title>
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
		<!-- �޷� �κ� -->
		<table width=100% height=540 cellspacing=0 cellpadding=0 border=1>
			<tr>
				<th colspan=2>
					<select id=year onchange='refreshCalendar()'>
						<%
						for(int i=year-70; i<year+70; i++){
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
					��&nbsp;&nbsp;					
					<select id=month onchange='refreshCalendar()'>
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
					��&nbsp;&nbsp;
					����ǥ
				</th>
			</tr>
			<tr>	
				<td width=80% height=90%>
				<iframe marginwidth=0 marginheight=0 src="../diary/calendar.jsp?year=<%=year%>&month=<%=month%>" id="calendar">		
					<!-- �޷� ��� �κ� -->
				</iframe>															
				</td>
				<td width=20%>
					�ش���� ���� ����� ǥ�õ˴ϴ�
				</td>
			</tr>
		</table>
	</center>
</body>
</html>