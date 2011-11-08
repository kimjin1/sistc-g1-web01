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
	function weatherChange(){
	
	var wc = document.getElementById("wn");
	weather="<Embed src='http://freewiw.kweather.co.kr/freenal/flash/type_1.swf'";
	weather+="flashVars='colorSet=1&dataPath=http://freewiw.kweather.co.kr/freenal/data/data";
	weather+= wc.value+".txt' width=150 height=145>";
	
	document.getElementById("wl").innerHTML = weather;	
	
	}
</script>
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
			<td>
				<select id=wn onchange='weatherChange()'>
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
			</td>
		</tr>
		<tr>
			<td align=center >
				<%-- 
				<script src="http://widgetprovider.daum.net/view?url=http://widgetcfs1.daum.net/xml/3/widget/2011/01/26/17/13/4d3fd792c255e.xml&up_city=Seoul&up_color=aquamarine&&width=170&height=115&widgetId=1046&scrap=1" type="text/javascript"></script>
				--%>				
				<%--<iframe scrolling="no" width=100% height=100% src="http://bgm.music24.kr/weather/9.php"></iframe> --%>
				<%--<iframe scrolling="no" width=100% height=100% src="http://bgm.music24.kr/weather/9.php"></iframe> --%>
				<DIV id="wl" style="overflow: hidden; width:150; heigth:107">
				<script language="javascript">
					weatherChange();
				</script>
				</DIV>
			</td>
		</tr>
		<%--
		<tr>
			<td align=center>
				<a href=../setup/setup.jsp target="main" ><img src=../image/edit1.png width=20 height=20 border=0>&nbsp;환경 설정</a>
			</td>
		</tr>
		 --%>
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