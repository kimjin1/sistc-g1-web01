<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.db.DiaryDAO"%>
<%@page import="com.db.DiaryVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	DiaryDAO dao = DiaryDAO.getInstance();
	int no = Integer.parseInt(request.getParameter("no"));
	DiaryVO dVO = dao.getEventContent(no);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-hh-mm");
	String date = sdf.format(dVO.getEvent_time());
	String event[] = date.split("-");
	String year = event[0];
	String month = event[1];
	String day = event[2];
	String strHour = event[3];
	String strMin = event[4];
	int hour = Integer.parseInt(strHour);
	int minute = Integer.parseInt(strMin);			
	request.setAttribute("hour", hour);
	request.setAttribute("minute", minute);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function event_modify(){
	var f = document.frm;	
	if(f.subject.value==""){
		alert("제목을 입력하세요");		
		f.subject.focus();
		return;
	}
	f.submit();
}
</script>
</head>
<body>
	<center>
		<table border=0 width=400 height=380 bgcolor="white">
			<tr>
				<td valign="top">
					<form method=post action="../diary/event_modify_ok.jsp" name="frm">
					<table width=100% height=100% border=0>
						<tr>
							<td colspan=2 height=10% align="center">
								<%-- 년,월,일까지 자동표시 시, 분을 선택 --%>
							<%=year %>. <%=month %>. <%=day %>.
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="hidden" name="no" value="<%=no%>">
							<input type="hidden" name="year" value="<%=year%>">  	 
							<input type="hidden" name="month" value="<%=month%>">
							<input type="hidden" name="day" value="<%=day%>">
							<select name="hour">							
									<c:forEach var="i" begin="0" end="23" step="1">
										<option${i==hour?" selected ":" "}value="${i }">${i }시</option>
									</c:forEach>
							</select>  
							<select name="minute">
									<c:forEach var="i" begin="0" end="59" step="1">
										<option${i==minute?" selected ":" " }value="${i }">${i }분</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td colspan=2>
								<hr>
							</td>
						</tr>
						<tr>
							<td width=20%>제목</td>
							<td width=80%>
								<input type="text" name="subject" size="45" value=<%=dVO.getSubject() %>>
							</td>
						</tr>
						<tr>
							<td width=20% valign="top">내용</td>
							<td width=80%>
								<textarea rows=16 cols=43 name=content><%=dVO.getContent() %></textarea>
							</td>
						</tr>
						<tr>
							<td colspan=2>
								<hr>
							</td>
						</tr>						
						<tr>
							<td colspan=2 align="center">							
								<input type="button" value="수정" onclick="event_modify()">
									&nbsp;&nbsp;
								<input type="button" value="취소" onclick="javascript:history.back()">								 
							</td>
						</tr>
					</table>
					</form>
					</td>
			</tr>
		</table>
	</center>
</body>
</html>