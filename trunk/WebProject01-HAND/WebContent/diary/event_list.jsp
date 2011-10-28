<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	DiaryDAO dao = DiaryDAO.getInstance();
	String id = (String)session.getAttribute("id");

	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	String strDay = request.getParameter("day");

	String ymd = strYear+"-"+strMonth+"-"+strDay;
	ArrayList<DiaryVO> dList = dao.getEventList(id, ymd);
	//System.out.println(dList.toString());
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
var year = <%=strYear%>;
var month = <%=strMonth%>;
var day = <%=strDay%>;
function openClose(){
	
}
function modifyEvent(no){		
	self.location.href="../diary/event_modify.jsp?year="+year+"&month="+month+"&day="+day+"&no="+no;
}
function deleteEvent(no){	
	self.location.href="../diary/event_delete.jsp?year="+year+"&month="+month+"&day="+day+"&no="+no;
}
</script>
</head>
<body>
<center>
	<table border=1 width=560 height=380 bgcolor="white">
		<tr>			
			<td align="left" valign="top">			
				<%--
					출력해야할 항목
					체크박스, 일시, 제목, 버튼(모두체크, 삭제, 신규)
				 --%>
				 <table border=1 width=100% height=100%>
				 	<tr>
				 		<th width=10%>
				 			<input type="checkbox">				 			
				 		</th>
				 		<th width=90% colspan=3 align="left">
							<a href="../diary/event_write.jsp?year=${param.year}&month=${param.month}&day=${param.day}">
								새 일정
							</a>
							&nbsp;&nbsp;
							<a href="">삭제</a>				 			
				 		</th>
				 	</tr>
				 	<tr>
				 		<td colspan=4>
				 			<hr>
				 		</td>
				 	</tr>
				 	<%-- 일정 목록 출력 부분 --%>
				 	<c:forEach var="vo" items="<%=dList%>" varStatus="DiaryVO">
					 	<tr>				 	
						 	<td align="center" width=10%>
						 		<input type="checkbox">
						 	</td>
						 	<td align="center" width=10%>
						 		<fmt:formatDate var="hm" value="${vo.getEvent_time() }" type="time" pattern="HH:mm"/>						 		
						 		${hm }						 		
						 	</td>
						 	<td width=60%>
						 		&nbsp;
						 		<a href="">						 								 	
								${vo.getSubject() }
								</a>
						 	</td>
						 	<td align="center" width=20%>
						 		<input type="button" value="수정" onclick="modifyEvent(${vo.getNo()})">
						 		<input type="button" value="삭제" onclick="deleteEvent(${vo.getNo()})">						 		
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