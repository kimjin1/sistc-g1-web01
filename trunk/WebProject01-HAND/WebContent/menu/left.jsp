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
					<option value="0"> ���� </option>
					<option value="20">��ǳ�� </option>
					<option value="40">���� </option>
					<option value="60">�س�  </option>
					<option value="1">ö�� </option>
					<option value="21">�ȵ� </option>
					<option value="41">��ȭ </option>
					<option value="61">����  </option>
					<option value="2"> ����õ </option>
					<option value="22"> ���� </option>
					<option value="42"> ���� </option>
					<option value="62"> ������  </option>
					<option value="3"> ���� </option>
					<option value="23"> ���� </option>
					<option value="43"> ��õ </option>
					<option value="63"> ��ȭ  </option>
					<option value="4"> ����� </option>
					<option value="24"> ���� </option>
					<option value="44"> ���� </option>
					<option value="64"> ����  </option>
					<option value="5"> ��õ </option>
					<option value="25"> �뱸 </option>
					<option value="45"> ȫõ </option>
					<option value="65"> ����  </option>
					<option value="6"> ��ɵ� </option>
					<option value="26"> ���� </option>
					<option value="46"> �¹� </option>
					<option value="66"> ����  </option>
					<option value="7"> ���� </option>
					<option value="27"> ��� </option>
					<option value="47"> ��õ </option>
					<option value="67"> �Ǽ�  </option>
					<option value="8"> ���� </option>
					<option value="28"> ���� </option>
					<option value="48"> ���� </option>
					<option value="68"> ����  </option>
					<option value="9" selected> ���� </option>
					<option value="29"> ���� </option>
					<option value="49"> õ�� </option>
					<option value="69"> ��õ  </option>
					<option value="10"> ��õ </option>
					<option value="30"> �λ� </option>
					<option value="50"> ���� </option>
					<option value="70"> ��â  </option>
					<option value="11"> ���� </option>
					<option value="31"> �뿵 </option>
					<option value="51"> �ο� </option>
					<option value="71"> ��õ  </option>
					<option value="12"> �︪�� </option>
					<option value="32"> ���� </option>
					<option value="52"> �ݻ� </option>
					<option value="72"> �о�  </option>
					<option value="13">����</option>
					<option value="33"> ���� </option>
					<option value="53"> �ξ� </option>
					<option value="73"> ��û  </option>
					<option value="14"> ���� </option>
					<option value="34"> ��굵 </option>
					<option value="54"> �ӽ� </option>
					<option value="74"> ����  </option>
					<option value="15"> ���� </option>
					<option value="35"> �ϵ� </option>
					<option value="55"> ���� </option>
					<option value="75"> ����  </option>
					<option value="16"> ���� </option>
					<option value="36"> ���� </option>
					<option value="56"> ���� </option>
					<option value="17"> ���� </option>
					<option value="37">���� </option>
					<option value="57">��� </option>
					<option value="18"> û�� </option>
					<option value="38">��� </option>
					<option value="58"> ��õ </option>
					<option value="19"> ���� </option>
					<option value="39"> ������ </option>
					<option value="59"> ���� </option>
				</select>
				<select id=w_type onchange='wetherType()'>
					<option value="1">Ÿ��1</option>
					<option value="2">Ÿ��2</option>
					<option value="3">Ÿ��3</option>
					<option value="4">Ÿ��4</option>
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