<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function write(){
	alert("����Ǿ����ϴ�");
	var f = document.event_frm();
	if(f.subject.value==""){
		alert("������ �Է��ϼ���");
		f.subject.focus();
		return;
	}
	if(f.content.value==""){
		alert("������ �Է��ϼ���");
		f.content.focus();
		return;
	}
	alert("�ԷµǾ����ϴ�");
	f.submit();
} 
</script>
</head>
<body>
	<center>
		<table border=1 width=280 height=400
			background="../image/diary/bg_content.png">
			<tr>
				<td width=8%>&nbsp;</td>
				<td width=92%>
					<form method=post action="event_write_ok.jsp" name="event_frm">
					<table width=100% height=100% border=1>
						<tr>
							<td colspan=2 height=10% align="right">
								<%-- ��,��,�ϱ��� �ڵ�ǥ�� ��, ���� ���� --%>
							${2011 }. ${10 }. ${25 }.
							&nbsp;&nbsp;&nbsp;&nbsp;  	 
							<select name="hour">							
									<c:forEach var="i" begin="1" end="24" step="1">
										<option>${i }��</option>
									</c:forEach>
							</select>  
							<select name="minute">
									<c:forEach var="i" begin="0" end="59" step="1">
										<option>${i }��</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td width=16%>����</td>
							<td width=76%><input type=text name=subject size=26>
							</td>
						</tr>
						<tr>
							<td width=20% valign="top">����</td>
							<td width=80%><textarea rows=20 cols=25 name=content></textarea>
							</td>
						</tr>
						<tr>
							<td colspan=2 align="center">
								<input type="button" value="�Է�" onclick="write()">
									&nbsp;&nbsp;
								<input type="button" value="���" onclick="javascript:history.back()">								 
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