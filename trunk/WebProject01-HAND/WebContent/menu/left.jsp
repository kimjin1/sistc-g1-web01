<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");

	String type=request.getParameter("ltype");
	
	if(type==null){
		type = "1";
	}
	
	String id=(String)session.getAttribute("id");	
	if(id==null) type="1";
	else type="2";
	
	int no = Integer.parseInt(type);
	String jsp="../login/loginmain.jsp?type="+type;;		
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
			<td align=center >
				<%-- 
				<script src="http://widgetprovider.daum.net/view?url=http://widgetcfs1.daum.net/xml/3/widget/2011/01/26/17/13/4d3fd792c255e.xml&up_city=Seoul&up_color=aquamarine&&width=170&height=115&widgetId=1046&scrap=1" type="text/javascript"></script>
				--%>				
				<%--<iframe scrolling="no" width=100% height=100% src="http://bgm.music24.kr/weather/9.php"></iframe> --%>
				<%--<iframe scrolling="no" width=100% height=100% src="http://bgm.music24.kr/weather/9.php"></iframe> --%>
				<DIV style="overflow: hidden; width:150; heigth:107">
				<Embed src="http://freewiw.kweather.co.kr/freenal/flash/type_1.swf" 
				flashVars="colorSet=1&dataPath=http://freewiw.kweather.co.kr/freenal/data/data9.txt" width=150 height=145></DIV>
			</td>
		</tr>
		<tr>
			<td align=center>
				<a href=../setup/setup.jsp target="main" ><img src=../image/edit1.png width=20 height=20 border=0>&nbsp;환경 설정</a>
			</td>
		</tr>
		<tr>
		<td>
			&nbsp;
		</td>
		</tr>
		<tr>
		<td align=center>
		<!-- background="../image/left_icon/facebook.png" -->
			<a href="http://www.facebook.com" target="test"><img src=../image/left_icon/facebook5.png border=0></a>
		</td>
		</tr>
		<tr>
			<td align=center> 
		<a href="http://www.twitter.com" target="test"><img src=../image/left_icon/twitter.png border=0></a>		
			</td>
		</tr>
		
		<tr>
			<td align=center>
		<a href="http://kr.youtube.com" target="test"><img src=../image/left_icon/you_tube.png border=0></a>		
			</td>
		</tr>
	</table>
</body>
</html>