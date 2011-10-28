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
<style type="text/css">
	a{text-decoration:none; color:black;}
	a:hover{text-decoration:underline; color:green}
</style>
<script type="text/javascript">
var year = <%=strYear%>;
var month = <%=strMonth%>;
var day = <%=strDay%>;
var flag = 0;
function openClose(no){
	var content = document.getElementById("con"+no);	
	if(flag==0){
		content.style.display='';
		flag = 1;	
	}else{
		content.style.display='none';
		flag = 0;
	}	
}
function modifyEvent(no){
	var url = "../diary/event_modify.jsp?year="+year+"&month="+month+"&day="+day+"&no="+no;
	self.location.href= url;
}
function deleteEvent(no){
	var url = "../diary/event_delete.jsp?year="+year+"&month="+month+"&day="+day+"&no="+no;
	self.location.href= url;
}
</script>
</head>
<body>
<center>
	<table border=0 width=550 height=380 bgcolor="white">
		<tr>			
			<td align="left" valign="top">			
				<%--
					����ؾ��� �׸�
					üũ�ڽ�, �Ͻ�, ����, ��ư(���üũ, ����, �ű�)
				 --%>
				 <table border=0 width=100% height=100%>
				 	<tr>
				 		<th width=10%>
				 			<input type="checkbox">				 			
				 		</th>
				 		<th width=90% colspan=3 align="left">
							<a href="../diary/event_write.jsp?year=${param.year}&month=${param.month}&day=${param.day}">
								�� ����
							</a>
							&nbsp;&nbsp;
							<a href="">����</a>				 			
				 		</th>
				 	</tr>
				 	<tr>
				 		<td colspan=4>
				 			<hr>
				 		</td>
				 	</tr>
				 	<%-- ���� ��� ��� �κ� --%>
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
						 		<a href="javascript:openClose(${vo.getNo() })">						 								 	
								${vo.getSubject() }
								</a>
						 	</td>
						 	<td align="center" width=20%>
						 		<input type="button" value="����" onclick="modifyEvent(${vo.getNo()})">
						 		<input type="button" value="����" onclick="deleteEvent(${vo.getNo()})">						 		
						 	</td>				 		
					 	</tr>
					 	<tr id="con${vo.getNo() }" style="display: none">
					 		<td width=10%>&nbsp;</td>
					 		<td width=10%>&nbsp;</td>
					 		<td colspan=2 width=80%>
					 			<%-- 
					 			<textarea rows="5" cols="70">${vo.getContent() }</textarea>
					 			--%>					 			
					 			<pre>&nbsp;&nbsp;${vo.getContent() }</pre>
					 		</td>					 		
					 	</tr>					 
					 	<tr>
					 		<td colspan=4>
					 			<hr>
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