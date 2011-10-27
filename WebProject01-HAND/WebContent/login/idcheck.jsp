<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
    <jsp:useBean id="dao" class="com.db.MemberDAO"/>
    <%
    	String id=request.getParameter("id");
  	 	 boolean bCheck=dao.isIdCheck(id);
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>


<script type="text/javascript">	
	function ok(){
		parent.frm.id.value=document.frm.id.value;
		parent.Shadowbox.close();
	}


	function idcheck(){
		var f=document.frm;
		if(f.id.value==""){
			alert("ID를 입력하세요");
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
	<form method=post action="../login/idcheck.jsp" name=frm>
		<table border=0 width=300>
			<tr>
				<td width=20% align=right>
				<font color=white>ID:</font></td>
				<td width=80% align=left>
				<input type=text name=id size=12 value="<%=id%>">
				<input type="button" value="ID체크" onclick="idcheck()">
				</td>
			</tr>
			<tr>
				<td colspan=2 align=center>
					<font color=blue><b>결과</b></font><!-- b태그는 두꺼운 글씨 -->
				</td>
			</tr>
				
			<tr>
				<td colspan=2 align=center>
					
			 <%
           if(bCheck==true)
           {
        	   %>
        	   <font color=yellow>
        	   <%=id %>는 사용 가능 합니다
        	   </font>
        	   <%
           }
           else
           {
        	 %>
        	 <font color=red>
        	   <%=id %>는 이미 사용중입니다
        	   </font>
        <%  
           }
        %>
					
				</td>
			</tr>
			<tr>
				<td align=center colspan=2>
					<input type=button value=확인 onclick="ok()">
				</td>
			</tr>
			
		</table>
		</form>
	</center>
</body>
</html>