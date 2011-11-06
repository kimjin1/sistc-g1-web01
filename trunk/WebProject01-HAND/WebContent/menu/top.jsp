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
			<a href="../home/home.jsp" target="main">
			<img src="../image/home1.png" border="0"
			width="120" height="60"
			OnMouseOver="this.src='../image/home2.png'"
			OnMouseOut="this.src='../image/home1.png'">
			</a>
		</td>
		<td valign=bottom align=center width=<%=width%>>
			<a href="../photo/photo.jsp" target="main">
			<img src="../image/photo1.png" border="0"
			width="120" height="60"
			OnMouseOver="this.src='../image/photo2.png'"
			OnMouseOut="this.src='../image/photo1.png'">
			</a>
		</td>
<!--		
 		<td valign=bottom align=center width=110>
			<a href="../file/file.jsp" target="main"><h3>FILE</h3></a>
		</td>
 -->
		<td valign=bottom align=center width=<%=width%>>
			<a href="../board/board.jsp" target="main">
			<img src="../image/board1.png" border="0"
			width="120" height="60"
			OnMouseOver="this.src='../image/board2.png'"
			OnMouseOut="this.src='../image/board1.png'">
			</a>
		</td>
		<td valign=bottom align=center width=<%=width%>>
			<a href="../visitor/visitor.jsp" target="main">
			<img src="../image/visitor1.png" border="0"
			width="120" height="60"
			OnMouseOver="this.src='../image/visitor2.png'"
			OnMouseOut="this.src='../image/visitor1.png'">
			</a>
		</td>
		<td valign=bottom align=center width=<%=width%>>
			<a href="../diary/diary.jsp" target="main">
			<img src="../image/diary1.png" border="0"
			width="120" height="60"
			OnMouseOver="this.src='../image/diary2.png'"
			OnMouseOut="this.src='../image/diary1.png'">
			</a>
		</td>
<!--
		<td valign=bottom align=center width=110>
			<a href="../menual.jsp" target="main"><h3>MENUAL</h3></a>
		</td>
  -->
	</tr>
	</table>
</body>
</html>