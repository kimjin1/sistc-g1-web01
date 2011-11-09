<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
<%@ page import="com.diary.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	// �޷� ���� ����� ��Ƴ��� DiaryCalendar Ŭ�����κ��� ���� ������ ���� ���´�
	DiaryCalendar myCalendar = DiaryCalendar.getInstance();
	int year = myCalendar.getCurrentYear();
	int month = myCalendar.getCurrentMonth();
	// EL����� ���� ��, ������ ����
	request.setAttribute("year", year);
	request.setAttribute("month", month);
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����</title>
<style type="text/css">
	iframe{
		width:100%;
		height:100%; 				 						
	}
</style>
<script type="text/javascript">
	// ������ �� ���úκа� �ϴ� �޷� ��� �κ��� �и�, ���� �� �� ����� ��ü ȭ�� ���� ���� �޷� �κи� �����Ѵ�
	function refreshCalendar(){
		var select_year = document.getElementById("year");
		var select_month = document.getElementById("month");
		var year = select_year.options[select_year.selectedIndex].value;
		var month = select_month.options[select_month.selectedIndex].value;
		calendar.location="../diary/calendar.jsp?year="+year+"&month="+month;	
	}
	function delExp(){		
		var flag = window.confirm("���� ������ �ϰ� ���� �˴ϴ�. ���� �Ͻðڽ��ϱ�?")
		if(flag==true){
			self.location.reload = "../diary/delete_expired.jsp";	
		}		
	}
</script>
</head>
<body>
	<center>
		<!-- �޷� �κ� -->
		<table border=0 width=100%>		
			<tr>			
			<td width=5%>
				<%-- �޷� ���鿡 ���� ǥ��. ���������� ��� ����
				<table border=0>
				<tr>
					<td>��</td><td>��</td>
				</tr>
				<tr>
				<td colspan=2>			
				<select id=year onchange='refreshCalendar()'>
					<c:forEach var="i" begin="${year-50 }" end="${year+50 }" step="1">
						<option${i==year?" selected":" "}>${i }</option>							
					</c:forEach>
				</select>			
				</td>
				</tr>				
				<tr><td colspan=2>��</td></tr>				
				</table>
				--%>							
			</td>
			<td width=90%>
				<table width=100% height=400 cellspacing=0 cellpadding=0 border=0>
					<tr>				
						<th width="25%" align="left" valign="middle" bgcolor="C2C2C2">&nbsp;</th>
						<th width="50%" align="center" valign="middle" bgcolor="C2C2C2">
							<%-- ���� ���� ���� -50 ~ +50���� ���. ���� ������ �⺻ ���� --%>
							<select id=year onchange='refreshCalendar()'>
								<c:forEach var="i" begin="${year-50 }" end="${year+50 }" step="1">
									<option${i==year?" selected":" "}>${i }</option>							
								</c:forEach>
							</select>
							��&nbsp;&nbsp;
							<%-- 1~12�� ���� ��� --%>					
							<select id=month onchange='refreshCalendar()'>						
								<c:forEach var="i" begin="1" end="12" step="1">
									<option${i==month?" selected":" " }>${i }</option>
								</c:forEach>
							</select>					
							��&nbsp;&nbsp;
							����ǥ							
						</th>
						<th width="25%" align="right" valign="middle" bgcolor="C2C2C2">
							<input type="button" value="������������" onclick="javascript:delExp()">
							&nbsp;
						</th>
					</tr>
					<tr>	
						<td width=100% height=90% colspan="3" bgcolor="orange">
						<%-- ���� �޷� ��ºκ��� iframe���� �и� (����� �κи� �����ϱ� ����) --%>
						<iframe frameborder="0" marginwidth=0 marginheight=0 src="../diary/calendar.jsp?year=<%=year%>&month=<%=month%>" id="calendar">		
							<!-- �޷� ��� �κ� -->
						</iframe>															
						</td>
					</tr>
				</table>
			</td>
			<td width=5%>
				<%-- �޷� ���鿡 �� ǥ��. ���������� ��� ����
				<table border=0>
				<tr>
					<td>��</td><td>��</td>
				</tr>
				<tr>
				<td colspan=2>
				<select id=month onchange='refreshCalendar()' >						
					<c:forEach var="i" begin="1" end="12" step="1">
						<option${i==month?" selected":" " }>&nbsp;&nbsp;${i }</option>
					</c:forEach>
				</select>
				</td>
				</tr>				
				<tr><td colspan=2>��</td></tr>				
				</table>
				--%>			
			</td>
			</tr>
		</table>
	</center>
</body>
</html>