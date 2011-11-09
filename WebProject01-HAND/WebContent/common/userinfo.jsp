<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
 <jsp:useBean id="dao" class="com.db.MemberDAO" />
 <%

 	String id=request.getParameter("id");
 	MemberVO vo = dao.getUserinfoData(id);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
	<center>
		<table border="0" width="300">
			<tr >
      	  		<td width=10% bgcolor=cccccc >이름</td>
        		<td width=15%><%=vo.getName() %></td>
			</tr>
			<tr >
      	  		<td width=10% bgcolor=cccccc >별명</td>
        		<td width=15%><%=vo.getNickname() %></td>
			</tr>
			<tr >
      	  		<td width=10% bgcolor=cccccc >생일</td>
        		<td width=15%><%=vo.getBirth() %></td>
			</tr>
			<tr >
      	  		<td width=10% bgcolor=cccccc >Email</td>
        		<td width=15%><%=vo.getEmail() %></td>
			</tr>
		</table>	
	</center>
</body>
</html>