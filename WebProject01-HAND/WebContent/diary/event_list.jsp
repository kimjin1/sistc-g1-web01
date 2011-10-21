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
	<table width=300 height=420 background="../image/diary/bg_content.png">
		<tr>
			<td width=7%></td>			
			<td width=93%>			
				<%--
					출력해야할 항목
					체크박스, 일시, 제목, 버튼(모두체크, 삭제, 신규)
				 --%>
				 일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정
				 일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정
				 일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정
				 일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정
				 일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정
				 일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정
				 일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정
				 일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정
				 일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정
				 일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정
				 일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정
				 일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정
				 일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정
				 일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정
				 일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정
				 일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정일정
			</td>			
		</tr>
	</table>
</center>
</body>
</html>