<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"  import="com.db.*"%>
    <%
    	String id =(String)session.getAttribute("id");    
    	System.out.println(id);
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function del(){
	var f = document.frm;
	f.submit();
}
</script>
</head>
<body>
<center>
		���� Ż���Ͻðڽ��ϱ�? ��¥?
		<form name=frm method=post action="delete_ok.jsp">
		 <table border=0 width=300>
      <tr>
       <td width=30%>��й�ȣ</td>
       <td width=70% align=left>
        <input type=password name=pw size=15>
        <input type=hidden name=id value="<%=id%>">
       
     
       </td>
      </tr>
      <tr>
       <td colspan=2 align=center>
        <input type=button value=Ż�� onclick="del()">
        <input type=button value=��� 
          onclick="javascript:history.back()">
       </td>
      </tr>
    </table>
    </form>
		</center>
</body>

</html>