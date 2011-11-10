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

<script language="javascript">
	
	var wc ="";
	var wt ="";
	
	
	function weatherChange(){
	wc = document.getElementById("w_select");
	var weather="";
	weather="<Embed src='http://freewiw.kweather.co.kr/freenal/flash/type_2.swf'";
	weather+="flashVars='colorSet=1&dataPath=http://freewiw.kweather.co.kr/freenal/data/data";
	weather+= wc.value+".txt' width=150 height=145>";
	
	document.getElementById("wl").innerHTML = weather;
	}
	
	function wetherType(){
	wt = document.getElementById("w_type");
	type="";
	type="<Embed src='http://freewiw.kweather.co.kr/freenal/flash/type_";
	type+=wt.value;
	type+=".swf'flashVars='colorSet=1&dataPath=http://freewiw.kweather.co.kr/freenal/data/data";
	type+= wc.value+".txt' width=150 height=145>";		
	document.getElementById("wl").innerHTML = type;
	}
</script>
</head>
<body>
<p><p><p><p>
	<table border=0 width=200 CellPadding=0 CellSpacing=0>
		<tr>
		
			<td>			
				<jsp:include page="<%=jsp %>"/>
			</td>
		</tr>
		<tr>
			<td align=center>
			<br>
				<select id=w_select onchange='weatherChange()'>
					<option value="9" selected> 서울 </option>
					<option value="19"> 대전 </option>
					<option value="25"> 대구 </option>
					<option value="30"> 부산 </option>
					<option value="10"> 인천 </option>
					<option value="29"> 광주 </option>
					<option value="27"> 울산 </option>
					<option value="7"> 강릉 </option>
					<option value="37">제주 </option>
					<option value="41">강화 </option>
					<option value="5"> 춘천 </option>
					<option value="6"> 백령도 </option>
					<option value="66"> 영덕  </option>
					<option value="8"> 동해 </option>
					<option value="12"> 울릉도 </option>
					<option value="13">수원</option>
					<option value="34"> 흑산도 </option>					
					<option value="74"> 거제  </option>
					<option value="39"> 서귀포 </option>
				
				</select>
				<select id=w_type onchange='wetherType()'>
					<option value="1">타입1</option>
					<option value="2">타입2</option>
					<option value="3">타입3</option>
					<option value="4">타입4</option>
				</select>
					
			</td>
		</tr>
		<tr>
			<td align=center valign="top">
				<DIV id="wl" style="overflow: hidden; width:150; heigth:107">
				<script language="javascript">
					weatherChange();
				</script>
				</DIV>
			</td>
		</tr>
		<tr>
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