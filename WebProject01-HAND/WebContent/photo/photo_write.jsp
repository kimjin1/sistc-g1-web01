<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
 th{font-family: �޸ո���ü;font-size: 11pt;color:white}
 td{font-family: �޸ո���ü;font-size: 10pt}
 a{text-decoration: none;color:black}
 a:hover{text-decoration: underline;color:green}
</style>
<script type="text/javascript">
function send()
{
	var f=document.frm;
	//���� (�����͸� action���� ����)
	f.submit();//<input type=submit>
	//<input type=image>:submit
}
</script>
</head>
<body>
   <center>

    <p>
    <!-- ������ ���� -->
    <form method=post action="photo_write_ok.jsp" 
    name=frm enctype="multipart/form-data">
    <table border=0 width=500>
     <tr>
      <td bgcolor=cccccc>
       <p>
        <table border=0 width=500>
         <tr>
          <td align=right width=20%>�ۼ���</td>
          <td align=left width=80%>
           <input type=text name=name size=15 value="<%=session.getAttribute("name")%>">
           <input type="hidden" name=id value="<%=session.getAttribute("id")%>"> 
          </td>
         </tr>
         <tr>
          <td align=right width=20%>�̸���</td>
          <td align=left width=80%>
           <input type=text name=email size=25 value="<%=session.getAttribute("email")%>">
           
          </td>
         </tr>
        
         <tr>
          <td align=right width=20% valign=top>����</td>
          <td align=left width=80%>
           <textarea rows="15" cols="49" name=content></textarea>
          </td>
         </tr>
         <tr>
          <td align=right width=20%>÷������</td>
          <td align=left width=80%>
           <input type=file name=upload size=30>
          </td>
         </tr>
        
         <tr>
          <td align=center colspan=2>
           <input type=button value=�۾��� onclick="send()">
           <input type=button value=��� 
             onclick="javascript:history.back()">
          </td>
         </tr>
        </table>
      </td>
     </tr>
    </table>
    </form>
   </center>
</body>
</html>

