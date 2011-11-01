<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");

	String type=request.getParameter("type");
	if(type==null){
		type="1";
	}
	
	int no = Integer.parseInt(type);
	String jsp="";
	switch(no){
	case 1: jsp="main.jsp"; 
		break;
	case 2: jsp = "login/join.jsp";		
		break;
	}	
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>HAND에 오신걸 환영합니다.</title>

<script type="text/javascript">
	var width = 1000;
	var height = 850;
	//self.location.reload(true);		
	self.moveTo((screen.width/2)-(width/2), (screen.height/2)-(height/2));	
	self.resizeTo(width, height);	
</script>

</head>
<%--  
<frameset rows="120, 1024" border="0" frameborder="yes">
    <frame name="top" noresize scrolling="no" marginwidth="0" marginheight="0"  src="menu/top.jsp">
    <frameset cols="200, 100%" border="0" frameborder="yes">
    <frame name="left" noresize scrolling="no" marginwidth="0" marginheight="0"  src="menu/left.jsp">
        <frame name="main" noresize scrolling="yes" marginwidth="0" marginheight="0"  src=<%=jsp %>>
    </frameset>
    <noframes>
    
<body bgcolor="white" text="black" link="blue" vlink="purple" alink="red">
<p>Have A Nice Day ^^</p>
</body>
    </noframes>
</frameset>
--%>

<frameset cols="20, 80" border="10" frameborder="yes">
	<frameset rows="10, 90" border="20" frameborder="yes">
		<frame name="left_top" noresize scrolling="no" marginwidth="0" marginheight="0"  src="menu/left_top.jsp">
		<frame name="left" noresize scrolling="no" marginwidth="0" marginheight="0"  src="menu/left.jsp">
	</frameset>
	<frameset rows="10, 90" border="20" frameborder="yes">
	    <frame name="top" noresize scrolling="no" marginwidth="0" marginheight="0"  src="menu/top.jsp">	
		<frame name="main" noresize scrolling="yes" marginwidth="0" marginheight="0"  src=<%=jsp %>>
    </frameset>
</frameset>

<%--
<body>
<center>
	<table border=1 width=900 height=650>
		
		<tr>
			<td width=200 height=60>
			<jsp:include page="menu/left_top.jsp"></jsp:include>
			</td>
			<td width=700 height=60>
			<jsp:include page="menu/top.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td width=200 height=470 valign=top>
			<jsp:include page="menu/left.jsp"></jsp:include>
			</td>
			<td width=700 height=470>
			<jsp:include page="<%=jsp %>"></jsp:include>
			</td>
		</tr>		
	</table>
</center>
</body>
 --%>
</html>
 