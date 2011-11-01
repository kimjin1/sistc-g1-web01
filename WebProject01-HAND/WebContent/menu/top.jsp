<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int width = 110;
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	a{text-decoration:none; color:black;}
	a:hover{text-decoration:underline; color:green}
</style>
</head>
<body>
	<table border=0>
	<tr>
		<%-- 
		<td valign=bottom align=center width=24%>
			<a href="../main.jsp" target="main">		
			<font color="green" size="20"><b>HAND</b></font>
			</a>
		</td>
		background="../image/login_image/log_bg.jpg"
		--%>
		<td valign=bottom align=center width=<%=width%> background="">
			<a href="../home/home.jsp" target="main"><h3>HOME</h3></a>
		</td>
		<td valign=bottom align=center width=<%=width%>>
			<a href="../photo/photo.jsp" target="main"><h3>PHOTO</h3></a>
		</td>
		<td valign=bottom align=center width=<%=width%>>
			<a href="../file/file.jsp" target="main"><h3>FILE</h3></a>
		</td>
		<td valign=bottom align=center width=<%=width%>>
			<a href="../board/board.jsp" target="main"><h3>BOARD</h3></a>
		</td>
		<td valign=bottom align=center width=<%=width%>>
			<a href="../visitor/visitor.jsp" target="main"><h3>VISITOR</h3></a>
		</td>
		<td valign=bottom align=center width=<%=width%>>
			<a href="../diary/diary.jsp" target="main"><h3>DIARY</h3></a>
		</td>
		<td valign=bottom align=center width=<%=width%>>
			<a href="../menual.jsp" target="main"><h3>MENUAL</h3></a>
		</td>
	</tr>
	</table>
</body>
</html>