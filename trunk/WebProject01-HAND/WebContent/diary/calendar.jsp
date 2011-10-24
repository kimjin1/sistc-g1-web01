<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.diary.*"%>
<%	
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	 
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
<style type="text/css">
	a{
		text-decoration:none;
		color:black;
	}
	a:hover{
		text-decoration:underline;
		color:orange;
	}	
</style>
<link rel="stylesheet" type="text/css" href="../shadowbox/shadowbox.css">
<script type="text/javascript" src="../shadowbox/shadowbox.js"></script>	
<script type="text/javascript">Shadowbox.init();</script>
<script type="text/javascript">
function openDetail(year, month, day){	
	Shadowbox.open({		
		content:"event_list.jsp?year="+year+"&month="+month+"&day="+day,
		player:"iframe",
		title:year+"."+month+"."+day+" ���� ����",
		width:"380",
		height:"500"		
	});
}
</script>
</head>
<body>
	<center>
		<table width=100% height=480 border=1>
			<tr>

			<%
			for(int i=0; i<7; i++){
				String[] week = {"��", "��", "ȭ", "��", "��", "��", "��"};
			%>
				<th width=14% height=5% bgcolor=#E8E8E8>
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
					<td align=left valign=top>					
					<%
					if(i==0 && j<offset-1){
					%>
						&nbsp;&nbsp;&nbsp;
					<%	
					}else if(startDate <= endDate){
					%>		
						<a href="javascript:openDetail(<%=year%>,<%=month%>,<%=startDate%>)"> 
						<b><%=startDate%></b>												
						</a>											
					<%													
						startDate++;
					}else{
					%>
						&nbsp;&nbsp;&nbsp;
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