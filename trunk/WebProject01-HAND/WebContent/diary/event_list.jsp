<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	String strDay = request.getParameter("day");
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<center>
	<table width=280 height=400 background="../image/diary/bg_content.png">
		<tr>
			<td width=8%>

			</td>			
			<td width=92% align=left>			
				<%--
					免仿秦具且 亲格
					眉农冠胶, 老矫, 力格, 滚瓢(葛滴眉农, 昏力, 脚痹)
				 --%>
				 <table>
				 	<tr>
				 		<td width=10%>
				 			<input type="checkbox">
				 		</td>
				 		<td width=90% align="right">
				 			<input type="button" value="货 老沥">
				 			<input type="button" value="昏力">
				 		</td>
				 	</tr>
				 </table>
				 老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废<br>
				 老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废<br>
				 老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废<br>
				 老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废<br>
				 老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废<br>
				 老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废<br>
				 老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废<br>
				 老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废老沥格废<br>
			</td>			
		</tr>
	</table>
</center>
</body>
</html>