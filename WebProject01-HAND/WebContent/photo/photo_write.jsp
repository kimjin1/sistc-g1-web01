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
    <img src="../include/image/title.gif">
    <p>
    <!-- ������ ���� -->
    <form method=post action="photo_write_ok.jsp" 
    name=frm enctype="multipart/form-data">
    <table border=0 width=600>
     <tr>
      <td bgcolor="rgb(255,255,200)">
       <p>
        <table border=0 width=560>
         <tr>
          <td align=right width=20%>���̵�</td>
          <td align=left width=80%>
           <input type=text name=id size=15>
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

