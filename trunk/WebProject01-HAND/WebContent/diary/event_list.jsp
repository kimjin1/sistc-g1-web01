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
function openClose(no){	
	var content = document.getElementById("con"+no);	
	if(content.style.display=='none'){
		content.style.display='';		
	}else{
		content.style.display='none';		
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
function selectAll(){
	var chkall = document.frm.chkall;	
	var check = document.frm.chklist;
		
	if(check=="undefined"){
		alert("안됨");
	}
	var i = 0;
	if(chkall.checked==true){		
		for(i=0; i<check.length; i++){
			check[i].checked = true;				
		}
	}else{				
		for(i=0; i<check.length; i++){						
			check[i].checked = false;			
		}		
	}	
}
function delSelected(){
	var check = frm.chklist;
	var flag = false;
	var i = 0;
	for(i=0; i<check.length; i++){
		if(check[i].checked==true){
			flag = true;
		}
	}
	if(flag==true){
		frm.submit();
	}else{
		alert("선택된 항목이 없습니다");		
	}
}

function currentTime(){
	var time = new Date();
	var hour = time.getHours();
	hour = hour<10?"0"+hour:hour;
	var minute = time.getMinutes();
	minute = minute<10?"0"+minute:minute;
	var second = time.getSeconds();
	second = second<10?"0"+second:second;
	var curTime = hour + " : " + minute + " : " + second;	
	document.frm.clock.value = curTime;
}
</script>
</head>
<body onload="currentTime(); setInterval('currentTime()', 1000)">
<center>
	<form name="frm" method="post" action="../diary/delete_all.jsp">	
	<table border=0 width="100%" height="100%" bgcolor="white">
		<tr>			
			<td align="left" valign="top">			
				<%--					
					체크박스, 일시, 제목, 버튼(모두체크, 삭제, 신규)
				 --%>
				 <table border=0 width="100%" height="100%">
				 	<tr>
				 		<th width="10%">
				 			<input type="checkbox" name="chkall" onclick="selectAll()">				 			
				 		</th>
				 		<th width=70% align="left" colspan=2>
							<a href="../diary/event_write.jsp?year=${param.year}&month=${param.month}&day=${param.day}">
								새 일정
							</a>
							&nbsp;
							<input type="hidden" name="year" value="<%=strYear%>">
							<input type="hidden" name="month" value="<%=strMonth%>">
							<input type="hidden" name="day" value="<%=strDay%>">
							<a href="javascript:delSelected()">선택 삭제</a>
							&nbsp;
							<%-- 시간이 지난 일정을 모두 삭제. 최종본에서 사용안함  											 		
							<a href="javascript:delSelected()">지난 일정삭제</a>
							--%>
				 		</th>				 		
				 		<th width="20%" align="right">
				 			<%-- 현재 시간 출력 택스트창 --%>				 			
				 			<input type="text" name="clock" readonly="readonly" size=10 align="middle" alt="현재시간" style="border: none">				 			
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
						 	<td align="center" width="10%">
						 		<input type="checkbox" name="chklist" value="${vo.getNo() }">
						 	</td>
						 	<td align="center" width="10%">
						 		<fmt:formatDate var="hm" value="${vo.getEvent_time() }" type="time" pattern="HH:mm"/>
						 		${hm }						 		
						 	</td>
						 	<td width="50%">
						 		&nbsp;
						 		<a href="javascript:openClose(${vo.getNo() })">						 								 	
								${vo.getSubject() }
								</a>
						 	</td>
						 	<td align="center" width="30%">
						 		<input type="button" value="수정" onclick="modifyEvent(${vo.getNo()})">
						 		<input type="button" value="삭제" onclick="deleteEvent(${vo.getNo()})">						 		
						 	</td>				 		
					 	</tr>
					 	<tr id="con${vo.getNo() }" style="display: none">
					 		<td width="10%">&nbsp;</td>
					 		<td width="10%">&nbsp;</td>
					 		<td colspan=2 width=80%>
					 			<%-- 
					 			<textarea rows="5" cols="70">${vo.getContent() }</textarea>
					 			--%>					 			
					 			<pre>&nbsp;&nbsp;${vo.getContent() }</pre>
					 		</td>					 		
					 	</tr>					 
					 	<tr>
					 		<td colspan="4">
					 			<hr>
					 		</td>
					 	</tr>	
				 	</c:forEach>
				 </table>
			</td>			
		</tr>
	</table>
	</form>	
</center>
</body>
</html>