<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");

	String type=request.getParameter("ltype");
	
	if(type==null){
		type = "1";
	}
	
	int no = Integer.parseInt(type);
	String jsp="";
	switch(no){
	case 1: jsp = "../login/loginmain.jsp?type=1"; 
		break;
	case 2: jsp = "../login/loginmain.jsp?type=2";		
		break;
	}	
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<p><p><p><p>
	<table border=0 width=200>
		<tr>
		
			<td>			
				<jsp:include page="<%=jsp %>"/>
			</td>
		</tr>
		<tr>
			<td align=center>
				<script src="http://widgetprovider.daum.net/view?url=http://widgetcfs1.daum.net/xml/3/widget/2011/01/26/17/13/4d3fd792c255e.xml&up_city=Seoul&up_color=aquamarine&&width=170&height=115&widgetId=1046&scrap=1" type="text/javascript"></script>
			</td>
		</tr>
		<tr>
			<td align=center>
				<a href=../setup/setup.jsp target="main" ><img src=../image/edit1.png width=20 height=20 border=0>&nbsp;ȯ�� ����</a>
			</td>
		</tr>
	</table>
</body>
</html>