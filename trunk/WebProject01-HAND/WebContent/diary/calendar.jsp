<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.diary.*, com.db.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	String[] strWeek = {"일", "월", "화", "수", "목", "금", "토"};
	request.setAttribute("week", strWeek);
	
	DiaryDAO dao = DiaryDAO.getInstance();
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	String id = (String)session.getAttribute("id");	 
	int year = Integer.parseInt(strYear);
	int month = Integer.parseInt(strMonth);	
	
	DiaryCalendar myDC = DiaryCalendar.getInstance();
	
	int todayDate = myDC.getCurrentDay();
	int todayYear = myDC.getCurrentYear();
	int todayMonth = myDC.getCurrentMonth();
	
	int result[] = myDC.getTodayCalendar(year, month);
	int startDate = 1;
	int endDate = result[0];
	int offset = result[1];

	System.out.println(todayYear+"|"+todayMonth+"|"+todayDate);
	int MonthlyEvent[] = dao.getEventCount(id, strYear, strMonth);
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	table {
		table-layout: fixed;
	}	
	a{
		text-decoration:none;
		color:black;
	}
	a:hover{
		text-decoration:underline;
		color:orange;
	}
	td{
		background-repeat: no-repeat;
		background-position: center;
	}	
</style>
<link rel="stylesheet" type="text/css" href="../shadowbox/shadowbox.css">
<script type="text/javascript" src="../shadowbox/shadowbox.js"></script>	
<script type="text/javascript">Shadowbox.init();</script>
<script type="text/javascript">
function openList(year, month, day){
	var id = "<%=id%>";		
	if(id=="null"){
		alert("로그인 하세요");
		return;
	}else{
		Shadowbox.open({		
			content:"event_list.jsp?year="+year+"&month="+month+"&day="+day,
			player:"iframe",
			title:year+"."+month+"."+day+" 일정",
			width:"550",
			height:"300",
            options:{  
                onClose: function(){ parent.location.reload(true); }               
            } 			
		}); 	
	}
}
</script>
</head>
<body>
	<center>
		<table width=100% height=340 border=1 bgcolor="#ccccff">
			<tr>
			<c:forEach var="dow" items="${week }" varStatus="weekth">
				<th width=14% height=27 bgcolor=#E8E8E8>
					<c:choose>						
						<c:when test="${weekth.getIndex() == 0}"><font color="red">${dow }</font></c:when>
						<c:when test="${weekth.getIndex() == 6}"><font color="blue">${dow }</font></c:when>
						<c:otherwise>${dow }</c:otherwise>
					</c:choose>
				</th>
			</c:forEach>
						
			<%
			for(int i=0; i<6; i++){
			%>
				<tr>
			<%	
				for(int j=0; j<7; j++){
				%>
					<td height=14% valign="top" bgcolor="white">					
					<%
					if(i==0 && j<offset-1){
					%>
						<table border=0 width=100% height=100%>
						<tr><td height="30">&nbsp;</td></tr>						
						</table>						
					<%	
					}else if(startDate <= endDate){
					%>	
						<table border=0 width=100% height=100%>	
						<tr>
						<td align="left" valign="top" height="10">
						<a href="javascript:openList(<%=year%>,<%=month%>,<%=startDate%>)"> 
						<b><%=startDate%></b>
						&nbsp;													
						</a>
						<%
						if(year==todayYear&&month==todayMonth&&startDate==todayDate){
						%>
							<img src="../image/diary/today_text.gif" border="0">
						<%
						}
						%>						
						</td>						
						</tr>						
					<%							
						if(MonthlyEvent[startDate-1] != 0){
						%>			
							<tr><td valign="middle" height="20" background="../image/diary/note.png">
							<%-- 				
							<img src="../image/diary/note_edit.png" border="0" alt="일정이 <%=MonthlyEvent[startDate-1] %>건 있습니다 ">
							--%>
							<u>
							<%=MonthlyEvent[startDate-1] %>
							</u>						
							</td></tr>
							</table>															
						<%	
						}else{
							%>
							<tr><td height="20">&nbsp;</td></tr>
							</table>
							<%
						}
						startDate++;
					}else{
					%>
						<table border=0 width=100% height=100%>
						<tr><td height="30">&nbsp;</td></tr>						
						</table>						
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
			<%-- JSTL로 전환 준비중
			<c:forEach var="i" begin="0" end="5" step="1" varStatus="week">
				<tr>
				<c:forEach var="j" begin="0" end="6" step="1" varStatus="day">
					<td>
					<c:when test=""></c:when>
					<c:when test=""></c:when>
					<c:otherwise></c:otherwise>
					</td>
				</c:forEach>
				</tr>
			</c:forEach>
			--%>
		</table>
	</center>					 				
</body>
</html>