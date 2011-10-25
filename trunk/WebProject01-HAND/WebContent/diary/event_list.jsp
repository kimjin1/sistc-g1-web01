<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
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
	<table border=1 width=540 height=380 bgcolor="white">
		<tr>			
			<td align="left" valign="top">			
				<%--
					출력해야할 항목
					체크박스, 일시, 제목, 버튼(모두체크, 삭제, 신규)
				 --%>
				 <table>
				 	<tr>
				 		<td width=10%>
				 			<input type="checkbox">
				 			&nbsp;&nbsp;
				 		</td>
				 		<td width=90% align="left">
							<a href="../diary/event_write.jsp?year=${param.year}&month=${param.month}&day=${param.day}">
								새 일정
							</a>
							&nbsp;&nbsp;
							<a href="">삭제</a>				 			
				 		</td>
				 	</tr>
				 	<tr>
				 		<td colspan=3>
				 			<hr>
				 		</td>
				 	</tr>
				 	<tr>
				 		<td>
				 			<input type="checkbox">
				 		</td>
				 		<td>
				 			제목
				 		</td>
				 		<td>
				 			<input type="button" value="수정">
				 		</td>
				 	</tr>
				 </table>
			</td>			
		</tr>
	</table>
</center>
</body>
</html>