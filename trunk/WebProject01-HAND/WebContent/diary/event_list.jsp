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
					����ؾ��� �׸�
					üũ�ڽ�, �Ͻ�, ����, ��ư(���üũ, ����, �ű�)
				 --%>
				 <table>
				 	<tr>
				 		<td width=10%>
				 			<input type="checkbox">
				 		</td>
				 		<td width=90% align="right">
				 			<input type="button" value="�� ����">
				 			<input type="button" value="����">
				 		</td>
				 	</tr>
				 </table>
				 ���������������������������������������������������������������<br>
				 ���������������������������������������������������������������<br>
				 ���������������������������������������������������������������<br>
				 ���������������������������������������������������������������<br>
				 ���������������������������������������������������������������<br>
				 ���������������������������������������������������������������<br>
				 ���������������������������������������������������������������<br>
				 ���������������������������������������������������������������<br>
			</td>			
		</tr>
	</table>
</center>
</body>
</html>