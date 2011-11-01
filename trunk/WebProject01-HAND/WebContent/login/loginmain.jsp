<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<%
	request.setCharacterEncoding("euc-kr");

	String type=request.getParameter("type");
	if(type==null){
		type="1";
	}

	int no = Integer.parseInt(type);
	String jsp = "login.jsp";
	switch(no){
		case 1: jsp="login.jsp"; break;
		case 2: jsp="logout.jsp"; break;
	}
	/*
	String id=(String)session.getAttribute("id");
	String logJsp="";
	if(id==null)
		logJsp="login.jsp";
	else
		logJsp="logout.jsp";
	*/
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="<%=jsp %>"></jsp:include>
</body>
</html>