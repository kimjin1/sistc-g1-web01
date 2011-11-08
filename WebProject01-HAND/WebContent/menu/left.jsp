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
					<option value="0"> 속초 </option>
					<option value="20">추풍령 </option>
					<option value="40">진주 </option>
					<option value="60">해남  </option>
					<option value="1">철원 </option>
					<option value="21">안동 </option>
					<option value="41">강화 </option>
					<option value="61">고흥  </option>
					<option value="2"> 동두천 </option>
					<option value="22"> 상주 </option>
					<option value="42"> 양평 </option>
					<option value="62"> 성산포  </option>
					<option value="3"> 문산 </option>
					<option value="23"> 포항 </option>
					<option value="43"> 이천 </option>
					<option value="63"> 봉화  </option>
					<option value="4"> 대관령 </option>
					<option value="24"> 군산 </option>
					<option value="44"> 인제 </option>
					<option value="64"> 영주  </option>
					<option value="5"> 춘천 </option>
					<option value="25"> 대구 </option>
					<option value="45"> 홍천 </option>
					<option value="65"> 문경  </option>
					<option value="6"> 백령도 </option>
					<option value="26"> 전주 </option>
					<option value="46"> 태백 </option>
					<option value="66"> 영덕  </option>
					<option value="7"> 강릉 </option>
					<option value="27"> 울산 </option>
					<option value="47"> 제천 </option>
					<option value="67"> 의성  </option>
					<option value="8"> 동해 </option>
					<option value="28"> 마산 </option>
					<option value="48"> 보은 </option>
					<option value="68"> 구미  </option>
					<option value="9" selected> 서울 </option>
					<option value="29"> 광주 </option>
					<option value="49"> 천안 </option>
					<option value="69"> 영천  </option>
					<option value="10"> 인천 </option>
					<option value="30"> 부산 </option>
					<option value="50"> 보령 </option>
					<option value="70"> 거창  </option>
					<option value="11"> 원주 </option>
					<option value="31"> 통영 </option>
					<option value="51"> 부여 </option>
					<option value="71"> 합천  </option>
					<option value="12"> 울릉도 </option>
					<option value="32"> 목포 </option>
					<option value="52"> 금산 </option>
					<option value="72"> 밀양  </option>
					<option value="13">수원</option>
					<option value="33"> 여수 </option>
					<option value="53"> 부안 </option>
					<option value="73"> 산청  </option>
					<option value="14"> 영월 </option>
					<option value="34"> 흑산도 </option>
					<option value="54"> 임실 </option>
					<option value="74"> 거제  </option>
					<option value="15"> 충주 </option>
					<option value="35"> 완도 </option>
					<option value="55"> 정읍 </option>
					<option value="75"> 남해  </option>
					<option value="16"> 서산 </option>
					<option value="36"> 진도 </option>
					<option value="56"> 남원 </option>
					<option value="17"> 울진 </option>
					<option value="37">제주 </option>
					<option value="57">장수 </option>
					<option value="18"> 청주 </option>
					<option value="38">고산 </option>
					<option value="58"> 순천 </option>
					<option value="19"> 대전 </option>
					<option value="39"> 서귀포 </option>
					<option value="59"> 장흥 </option>
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