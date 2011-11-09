<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.diary.*, com.db.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	String[] strWeek = {"��", "��", "ȭ", "��", "��", "��", "��"};
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
	
	int MonthlyEvent[] = dao.getEventCount(id, strYear, strMonth);
	request.setAttribute("offset", offset);	
	request.setAttribute("endDate", endDate);
	request.setAttribute("MonthlyEvent", MonthlyEvent);
	request.setAttribute("year", year);	
	request.setAttribute("month", month);
	request.setAttribute("todayYear", todayYear);
	request.setAttribute("todayMonth", todayMonth);
	request.setAttribute("todayDate", todayDate);	
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	table{
		table-layout: fixed;
		word-wrap: break-word;
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
		alert("�α��� �ϼ���");
		return;
	}else{
		// ���� ����, ����, �������� ������ ������ �ڽ��� ��� iframe�ȿ��� ǥ��
		Shadowbox.open({		
			content:"event_list.jsp?year="+year+"&month="+month+"&day="+day,
			player:"iframe",
			title:year+"."+month+"."+day+" ����",
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
		<%-- ���� ���� ��� --%>
		<table width=100% height=360 border=0 bgcolor="#787878">
			<tr>
			<c:forEach var="dow" items="${week }" varStatus="weekth">
				<th width=14% height=12 bgcolor=#E8E8E8>
					<c:choose>						
						<%-- �Ͽ���, ������� ���� ������, �Ķ������� ���� ǥ�� --%>
						<c:when test="${weekth.getIndex() == 0}"><font color="red">${dow }</font></c:when>
						<c:when test="${weekth.getIndex() == 6}"><font color="blue">${dow }</font></c:when>
						<c:otherwise>${dow }</c:otherwise>
					</c:choose>
				</th>
			</c:forEach>
			
			<%-- �޷� ��� --%>		
			<c:set var="startDate" value="1"/>
			<c:forEach var="i" begin="0" end="5" step="1" varStatus="week">
				<tr>
				<c:forEach var="j" begin="0" end="6" step="1" varStatus="day">
					<td height=13% valign="top" bgcolor="white">
						<table width=100%>
						<c:choose>							
							<%-- ù���϶� 1���� Day of week��ŭ �ǳʶ��� ���� --%>
							<c:when test="${i==0 && j<offset-1}">
								<tr><td>&nbsp;</td></tr>
							</c:when>
							<c:otherwise>								
								<c:if test="${startDate <= endDate }">
									<tr><td valign="top" align="left">
									<%-- ��¥�� Ŭ���� �ش����� ��������� ���� --%>
									<a href="javascript:openList(${year},${month},${startDate})">
									<b>${startDate }</b>	
									</a>
									<%-- ������ ǥ�� --%>
									<c:if test="${year==todayYear&&month==todayMonth&&startDate==todayDate}">
										&nbsp;&nbsp;<img src="../image/diary/today_text.gif" border="0" alt="�����Դϴ�"/>
									</c:if>								
									</td></tr>
									<%-- �ش� ���� ���������� �����ܰ� �Բ� ��� --%>
									<c:if test="${MonthlyEvent[startDate-1] != 0}">
									<tr><td align="center" background="../image/diary/note.png">
										<a href="javascript:openList(${year},${month},${startDate})">										
										<u>${MonthlyEvent[startDate-1] }</u>										
										</a>
									</td></tr>
									</c:if>	
									<c:set var="startDate" value="${startDate+1 }"/>								
								</c:if>																																
							</c:otherwise>						
						</c:choose>
						</table>					
					</td>
				</c:forEach>
				</tr>
			</c:forEach>			
		</table>
	</center>					 				
</body>
</html>