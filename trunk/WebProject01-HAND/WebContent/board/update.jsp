<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
<jsp:useBean id="dao" class="com.db.BoardDAO"/>
<%	
    String strNo=request.getParameter("no");
    String strPage=request.getParameter("page");
  	BoardVO vo=
       dao.getUpdateData(Integer.parseInt(strNo));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function send()
{
	var f=document.frm;
	if(f.name.value=="")
	{
		alert("�̸��� �Է��ϼ���");
		f.name.focus();
		return;
	}
	
	if(f.subject.value=="")
	{
		alert("������ �Է��ϼ���");
		f.subject.focus();
		return;
	}
	
	if(f.content.value=="")
	{
		alert("������ �Է��ϼ���");
		f.content.focus();
		return;
	}
	if(f.pw.value=="")
	{
		alert("��й�ȣ�� �Է��ϼ���");
		f.pw.focus();
		return;
	}
	
	
	//���� (�����͸� action���� ����)
	f.submit();//<input type=submit>
	//<input type=image>:submit
}
</script>
</head>
<body>
<center>
<form method=post action="../board/update_ok.jsp" name=frm>
	<table border=5 width=800>
		<tr>
	   		 <td width=20% bgcolor=cccccc>����</td>
       		 <td align=left colspan=3><input type=text name=subject size=50 value="<%=vo.getSubject() %>">
       		
       		 </td>
        </tr>
        <tr>
        	<td width=15% align=left bgcolor=cccccc>�̸�</td>
        	<td width=25%><input type=text name=name size=15 value=<%=vo.getName() %>>
        	<input type=hidden name=no value=<%=strNo %>>
           <input type=hidden name=page value=<%=strPage %>>
        	</td>
        	
        	<td width=15% align=left bgcolor=cccccc>Email</td>
        	<td width=45%><input type=text name=email size=50 value=<%=vo.getEmail() %>>
        	</td>
        </tr>
        
        <tr>
       	 	<td align=left colspan=4 valign=top height=200>
        	 	<textarea rows="25" cols="109" name=content><%=vo.getContent() %></textarea>
        	 	<input type="hidden" name=id value="<%=session.getAttribute("id")%>">
        	</td>
       </tr>
       <tr>
          <td align=right width=20%>��й�ȣ</td>
          <td align=left width=80%>
           <input type=password name=pw size=10>
          </td>
       
	</table>
	<table border=5 width=800>
		<tr>
		   <td align=center colspan=2>
          	 <input type=button value=���� onclick="send()" >
          	 <input type=button value=��� 
             onclick="javascript:history.back()">
          </td>
         </tr>
	</table>
	</form>
</center>
</body>
</html>