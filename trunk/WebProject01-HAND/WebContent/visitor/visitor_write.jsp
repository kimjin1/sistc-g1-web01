<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function send(){
	
	var f=document.visitor_frm;
	if(f.subject.value=="")
		{
			alert("�̸��� �Է��ϼ���");
			f.subject.focus();
			return;
		}
	
	
	if(f.content.value=="")
	{
		alert("������ �Է��ϼ���");
		f.content.focus();
		return;
	}
	f.submit();
}
</script>
</head>
<body>
	<center>
	
		<h1>���� ����</h1>
		<form method=post action="visitor_write_ok.jsp"name="visitor_frm">
		<table border=0  width=500 bgcolor=f5f0c5>
		<%--
			<tr>
				<td align=right width=20%>�� �Ӽ�</td>
				<td align=left width=80%>
				<select name=num>
					<option value="1">�Ϲ�</option>
					<option value="2">�����</option>
				
				</select>
				</td>
			</tr>
			--%>
			
		
			<tr>
				<td align=right width=50%>�ۼ���</td>
				<td align=left width=30%>
				<input type=text name=name size=10>
				</td>
			</tr>
			<tr>
			<td align=right width=50%>Ȩ������</td>
			<td align=left width=30%>
			<input type=text name=homepage size=25></td>
			</tr>
			
			<tr>
				<td align=right width=20% valign=top>����</td>
				<td align=left width=80%>
				<textarea rows="12" cols="55" name=content></textarea>
				</td>
			</tr>
			
			<tr>
				<td align=center colspan=2>
				<input type=submit value="���" onclick="send()">
				<input type=button value="���" onclick="javascript:history.back()">
				</td>
			</tr>
		</table>
		</form>
	</center>
</body>
</html>