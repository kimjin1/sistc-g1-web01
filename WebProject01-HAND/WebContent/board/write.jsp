<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function send()
{
	var f=document.frm;
	if(f.subject.value=="")
	{
		alert("������ �Է��ϼ���");
		f.subject.focus();
		return;
	}
	var f=document.frm;
	if(f.name.value=="")
	{
		alert("�̸��� �Է��ϼ���");
		f.name.focus();
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
 <form method=post action="../board/write_ok.jsp" name=frm>
	<table border=10 width=800>
		<tr>
	   		 <td width=20% bgcolor=cccccc>����</td>
       		 <td align=left colspan=3><input type=text name=subject size=50>
       		 </td>
        </tr>
        <tr>
        	<td width=15% align=left bgcolor=cccccc>�̸�</td>
        	<td width=25%><input type=text name=name size=15>
        	</td>
        	
        	<td width=15% align=left bgcolor=cccccc>Email</td>
        	<td width=45%><input type=text name=email size=50>
        	</td>
        </tr>
        
        <tr>
       	 	<td align=left colspan=4 valign=top height=200>
        	 	<textarea rows="25" cols="109" name=content></textarea>
        	</td>
       </tr>
       
	</table>
	<table border=5 width=800>
		
       <tr>
          <td align=center colspan=3>
           <input type=button value=�۾��� onclick="send()">
           <input type=button value=��� 
             onclick="javascript:history.back()">
          </td>
         </tr>
	</table>
	</form>
</center>
</body>
</html>