<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
<jsp:useBean id="dao" class="com.db.BoardDAO"/>
<%
	String pw=request.getParameter("pw");
    String id=(String)session.getAttribute("id");
    boolean bCheck=dao.isPwCheck(id,pw);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="../js/shadowbox.js"></script>
<script type="text/javascript">
function ok()
{
	parent.frm.id.value=document.frm.id.value;
	parent.Shadowbox.close();
}
function pwcheck()
{
	var f=document.frm;
	if(f.id.value=="")
	{
		alert("��й�ȣ�� �Է��ϼ���");
		f.id.focus();
		return;
	}
	f.submit();
}
</script>
</head>
<body>
  <center>
  <p><p><p>
    <form method=post action="../board/update_ok.jsp" name=frm>
    <table border=0 width=280>
     <tr>
      <td width=20% align=right>
      <font color=white>��й�ȣ:</font>
      </td>
      <td width=80% align=left>
       <input type=text name=id size=12 
         value="<%=id%>">
       <input type="button" value="��й�ȣüũ" 
         onclick="pwcheck()">
      </td>
     </tr>
     <tr>
      <td colspan=2 align=center>
       <font color=blue><b>���</b></font>
      </td>
     </tr>
     <tr>
       <td colspan=2 align=center>
        <%
           if(bCheck==true)
           {
        %>
              <font color=cyan>
              <%=id %>�� �½��ϴ�.
              </font>
        <%
           }
           else
           {
        %>
              <font color=pink>
              <%=id %>�� Ʋ���ϴ�.
              </font>
        <%   
           }
        %>
       </td>
     </tr>
     <%
        if(bCheck==true)
        {
     %>
     <tr>
      <td align=center colspan=2>
       <input type=button value=Ȯ�� onclick="ok()">
      </td>
     </tr>
     <%
        }
     %>
    </table>
    </form>
  </center>
</body>
</html>




