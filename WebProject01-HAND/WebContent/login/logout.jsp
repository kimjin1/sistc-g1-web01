<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
	<form method=post action="../login/logout_ok.jsp">
		<table border=0 width=200 height=80 background="../image/login_image/log_bg.jpg">
		
			<tr>
				<td align=right >
				<%
				Integer in=(Integer)session.getAttribute("admin");
				int admin=in.intValue();
				if(admin==1){
					%>
					<font color=red><i>관리자</i></font><br>
					<%
				}
				else{
			%>
			<font color=red><i>일반사용자</i></font><br>
			<%
				}
			%>
			<%=session.getAttribute("name") %>님<br>로그인 중입니다
				</td>
				
				<td rowspan=2><a href="../login/loginout_ok.jsp"><img src="../image/login_image/logout.jpg" border=0></a></td>	
			</tr>
			
			
		</table>
		</form>
	</center>
</body>
</html>