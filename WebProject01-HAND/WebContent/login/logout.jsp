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
		<table border=0 width=130 height=80 background="../image/login_image/log_bg.jpg">
		
			<tr>
				<td align=right>
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
			<%=session.getAttribute("name") %>님 로그인중입니다
				</td>
				
				<td rowspan=2><img src="../image/login_image/logout.jpg"></td>	
			</tr>
			
			
		</table>
	</center>
</body>
</html>