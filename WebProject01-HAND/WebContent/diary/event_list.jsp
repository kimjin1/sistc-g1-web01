<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	DiaryDAO dao = DiaryDAO.getInstance();
	String id = (String)session.getAttribute("id");

	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	String strDay = request.getParameter("day");

	String ymd = strYear+"-"+strMonth+"-"+strDay;
	ArrayList<DiaryVO> dList = dao.getEventList(id, ymd); 
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
					����ؾ��� �׸�
					üũ�ڽ�, �Ͻ�, ����, ��ư(���üũ, ����, �ű�)
				 --%>
				 <table>
				 	<tr>
				 		<td width=10%>
				 			<input type="checkbox">
				 			&nbsp;&nbsp;
				 		</td>
				 		<td width=90% align="left">
							<a href="../diary/event_write.jsp?year=${param.year}&month=${param.month}&day=${param.day}">
								�� ����
							</a>
							&nbsp;&nbsp;
							<a href="">����</a>				 			
				 		</td>
				 	</tr>
				 	<tr>
				 		<td colspan=3>
				 			<hr>
				 		</td>
				 	</tr>
				 	<%-- ���� ��� ��� �κ� --%>
				 	<c:forEach var="vo" items="<%=dList%>" varStatus="DiaryVO">
					 	<tr>				 	
						 	<td>
						 		<input type="checkbox">
						 	</td>
						 	<td>				 			
						 		${vo.getSubject() }
						 	</td>
						 	<td>
						 		<input type="button" value="����">
						 		<input type="button" value="����">
						 	</td>				 		
					 	</tr>
				 	</c:forEach>
				 </table>
			</td>			
		</tr>
	</table>
</center>
</body>
</html>