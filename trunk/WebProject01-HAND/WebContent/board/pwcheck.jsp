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
	parent.location="../board/update.jsp";
	parent.Shadowbox.close();
}
function pwcheck()
{
	var f=document.frm;
	if(f.id.value=="")
	{
		alert("비밀번호를 입력하세요");
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
    <form method=post action="../board/pwcheck.jsp" name=frm>
    <table border=0 width=280>
     <tr>
      <td width=20% align=right>
      <font color=white>비밀번호:</font>
      </td>
      <td width=80% align=left>
       <input type=text name=id size=12 
         value="<%=id%>">
       <input type="button" value="비밀번호체크" 
         onclick="pwcheck()">
      </td>
     </tr>
     <tr>
      <td colspan=2 align=center>
       <font color=blue><b>결과</b></font>
      </td>
     </tr>
     <tr>
       <td colspan=2 align=center>
        <%
           if(bCheck==true)
           {
        %>
              <font color=cyan>
              <%=id %>는 맞습니다.
              </font>
        <%
           }
           else
           {
        %>
              <font color=pink>
              <%=id %>는 틀립니다.
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
      	<input type=hidden name=no value=<%=request.getParameter("no") %>">
      	<input type=hidden name=page value=<%=request.getParameter("page") %>">
       <input type=button value=확인 onclick="ok()">
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




