<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� ����</title>
<style type="text/css">
 td{font-family: �޸ո���ü;font-size: 10pt}
 h3{font-family: �޸ո���ü;font-size: 15pt}
</style>
<link rel="stylesheet" type="text/css" href="../shadowbox/shadowbox.css">
<script type="text/javascript" src="../shadowbox/shadowbox.js"></script>	
<script type="text/javascript">Shadowbox.init();</script>

<script type="text/javascript">
function login()
{
	var f=document.frm;
	if(f.id.value=="")
	{
		alert("ID�� �Է��ϼ���");
		f.id.focus();
		return;
	}
	Shadowbox.open(
	   {
		   content:"../login/idcheck.jsp?id="+f.id.value,
		   player:"iframe",
		   title:"ID�ߺ�üũ",
		   width:300,
		   height:150
	   }
	);
}
</script>
<script type="text/javascript">
function pwdCheck(){
	var f = document.frm;		
	if(f.pw.value==f.pw2.value){
		f.pwdchk.style.color="blue";
		f.pwdchk.value="�غ�й�ȣ�� ��ġ�մϴ�";
		f.name.focus();
	}else{			
		f.pwdchk.style.color="red";
		f.pwdchk.value="�غ�й�ȣ�� ��ġ���� �ʽ��ϴ�";
	}		
}
</script>
<script type="text/javascript">
function join_ok(){
	
	var f=document.frm;
	if(f.id.value=="")
	{
		alert("ID�� �Է��ϼ���");
		f.id.focus();
		return;
	} 
	if(f.pw.value=="")
	{
		alert("Password�� �Է��ϼ���");
		f.pw.focus();
		return;
	}
	if(f.name.value=="")
	{
		alert("�̸��� �Է��ϼ���");
		f.name.focus();
		return;
	}
	
	f.submit();
}
</script>
<script type="text/javascript">
function avatar()
{
	
	Shadowbox.open(
	   {
		   content:"../login/avatarcheck.jsp",
		   player:"iframe",
		   title:"�ƹ�Ÿ ����",
		   width:750,
		   height:500,
	   }
	);
}
</script>
</head>
<body>
	<center>
	<P>
		<h3>ȸ������</h3>
		<form method=post action="../login/join_ok.jsp" name=frm >
		 <table border=1 bordercolor=black width=600
     cellpadding="0" cellspacing="0">
       <tr>
         <td>
          <table border=0 width=600>
           <tr>
            <td align=right width=20%>ID</td>
            <td align=left width=80%>
              <input type=text size=12 name=id>
              <input type=button 
              value="�ߺ�üũ" onclick="login()">
            </td>
           </tr>
           
           <tr>
            <td align=right width=20%>��й�ȣ</td>
            <td align=left width=80%>
              <input type=password size=12 name=pw>
              &nbsp;&nbsp;&nbsp;
     			         ��й�ȣ Ȯ��
     		 <input type=password size=12 name=pw2 onkeyup="pwdCheck()">
     	
     		 
            </td>
           </tr>
           
           <tr>
            <td align=right width=20%>�̸�</td>
            <td align=left width=80%>
              <input type=text size=12 name=name>
              <input type=text size=27 name=pwdchk readonly>
            </td>
           </tr>
           
              
           <tr>
            <td align=right width=20%>����</td>
            <td align=left width=80%>
             <select name=year>
             <%
             int year =0;
             for(int i=1900;i<2050; i++){
            	 if(i==year){
            		 %>
            		 <option selected><%=i %></option>
            		 <%
            	 }else{
            		 %>
            		 <option ><%=i %></option>
            		 <%
            	 }
            	 %>
             <%
             }
             %>
          
             </select> �� 
            <select name=month>
             <%
             int month =0;
             for(int i=01;i<13; i++){
            	 if(i==month){
            		 %>
            		 <option selected><%=i %></option>
            		 <%
            	 }else{
            		 %>
            		 <option ><%=i %></option>
            		 <%
            	 }
            	 %>
             <%
             }
             %>
          
             </select> ��
            <select name=day>
             <%
             int day =0;
             for(int i=1;i<32; i++){
            	 if(i==day){
            		 %>
            		 <option selected><%=i %></option>
            		 <%
            	 }else{
            		 %>
            		 <option ><%=i %></option>
            		 <%
            	 }
            	 %>
             <%
             }
             %>
          
             </select> ��
            </td>
           </tr>
           
           <tr>
            <td align=right width=20%>����</td>
            <td align=left width=80%>
              <input type=text size=12 name=nickname>
              <input type=button value="�ƹ�Ÿ ����" onclick="avatar()">
              <input type="hidden" name=path>
             
              
            </td>        
           </tr>
           
           <tr>
            <td align=right width=20%>�̸���</td>
            <td align=left width=80%>
             <input type=text size=50 name=email>
              <br>�̸��� 50���� ���Ϸ� �ۼ��ϼ���
            </td>
           </tr>
           
          
           
           <tr>
            <td align=right width=20%>Ȩ������</td>
            <td align=left width=80%>
             <input type=text size=50 name=homepage>
            </td>
           </tr>
           
           <tr>
             <td align=right width=20% valign=top>�Ұ�</td>
             <td align=left width=80%>
               <textarea rows="12" cols="50" name=memo></textarea>
             </td>
           </tr>
     
           <tr>
             <td align=center colspan=2>
              <input type=button value="ȸ������" onclick="join_ok()" >
              <input type="reset" value="���" onclick="javascript:history.back()">
             </td>
           </tr>
           </table>
          </table> 
          </form>
	</center>
</body>
</html>