<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ���ε�</title>
<script type="text/javascript">
function send(){
	
	var f=document.photo_frm;
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
		<h3>���� �ø���</h3>
		<table border=0 width=800 bgcolor=#ccccff>
			<tr>
				<td align=right width=20%>����
				<td align=left width=80%><input type=text size=20>
			</tr>
			<tr>
				<td align=right width=20% valign=top>����</td>
				<td align=left width=80%><textarea rows="15" cols="49"
						name=content></textarea></td>
			</tr>
			<tr>
				<td align=right width=20%>���� ���ε�</td>
				<td align=left width=80%><input type=file name=upload size=30>
				</td>
			</tr>
		
			
         <tr>
    
          <td align=center colspan=2>
           <input type=submit value=���>&nbsp;&nbsp;
           <input type=button value=��� onclick="javascript:history.back()">
          </td>
         </tr>
		</table>
	</center>

</body>
</html>