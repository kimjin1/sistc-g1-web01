<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
    <jsp:useBean id="dao" class="com.db.MemberDAO"/>
     <%
    	
  	 	 
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>


<script type="text/javascript">	

function ok(photo){
		
		parent.frm.path.value = photo;
		parent.Shadowbox.close();
	}

</script>
</head>
<body>
	<center>
	<p><p><p>
	<form method=post action="../login/avatarcheck.jsp" name=frm>
		<table border=0 width=300>
			<tr>
				<td >	
				<a href="javascript:ok('../image/avatar/chracter01.png')">
				<img src="../image/avatar/chracter01.png" width=95 height=95  border=1>
				</a>
				</td>
				<td>
				<a href="javascript:ok('../image/avatar/chracter02.png')">
				<img src="../image/avatar/chracter02.png" width=95 height=95 border=1>
				</a>
				</td>
				<td >
				<a href="javascript:ok('../image/avatar/chracter03.png')">	
				<img src="../image/avatar/chracter03.png" width=95 height=95  border=1>
				</a>
				</td>
				<td>
				<a href="javascript:ok('../image/avatar/chracter04.png')">	
				<img src="../image/avatar/chracter04.png" width=95 height=95 border=1>
				</a>
				</td>
			</tr>
			<tr>
			<td >
			<a href="javascript:ok('../image/avatar/chracter05.png')">	
				<img src="../image/avatar/chracter05.png" width=95 height=95  border=1>
				</a>
				</td>
				<td>
				<a href="javascript:ok('../image/avatar/character06.png')">
				<img src="../image/avatar/character06.png" width=95 height=95 border=1>
				</a>
				</td>
				<td >
				<a href="javascript:ok('../image/avatar/character07.png')">	
				<img src="../image/avatar/character07.png" width=95 height=95  border=1>
				</a>
				</td>
				<td>
				<a href="javascript:ok('../image/avatar/character08.png')">
				<img src="../image/avatar/character08.png" width=95 height=95 border=1>
				</a>
				</td>
			</tr>
			<tr>
			<td>
				<a href="javascript:ok('../image/avatar/character09.png')">
				<img src="../image/avatar/character09.png" width=95 height=95 border=1>
				</a>
				</td>
				<td >	
				<a href="javascript:ok('../image/avatar/character10.png')">
				<img src="../image/avatar/character10.png" width=95 height=95  border=1>
				</a>
				</td>
				<td>
				<a href="javascript:ok('../image/avatar/character11.png')">
				<img src="../image/avatar/character11.png" width=95 height=95 border=1>
				</a>
				</td>
			</tr>
	
		</table>
		</form>
	</center>
</body>
</html>