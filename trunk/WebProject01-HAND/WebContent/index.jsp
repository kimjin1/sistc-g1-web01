<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");

	String type=request.getParameter("type");
	if(type==null){
		type="1";
	}
	
	int no = Integer.parseInt(type);
	String jsp="main.jsp";
	switch(no){
	case 1: jsp="main.jsp"; 
		break;
	case 2: jsp = "login/join.jsp";		
		break;
	}
	
	String id=(String)session.getAttribute("id");
	String ltype="";
	if(id==null)
		ltype="1";
	else
		ltype="2";

%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>HAND에 오신걸 환영합니다.</title>

<script type="text/javascript">
	var width = 1024;
	var height = 768;
	//self.location.reload(true);		
	self.moveTo((screen.width/2)-(width/2), (screen.height/2)-(height/2));	
	self.resizeTo(width, height);	
</script>

</head>
 
<frameset rows="120, 1024" border="0">
    <frame name="top" noresize scrolling="no" marginwidth="0" marginheight="0"  src="menu/top.jsp">
    <frameset cols="200, 100%" border="0">
    <frame name="left" noresize scrolling="no" marginwidth="0" marginheight="0"  src="menu/left.jsp?ltype=<%=ltype%>">
        <frame name="main" noresize scrolling="yes" marginwidth="0" marginheight="0"  src=<%=jsp %>>
    </frameset>
    <noframes>
    
<body bgcolor="white" text="black" link="blue" vlink="purple" alink="red">
<p>Have A Nice Day ^^</p>
</body>
    </noframes>
</frameset>
</html>


