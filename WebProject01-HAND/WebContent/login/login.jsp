<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script type="text/javascript">
function login2()//로그인 창에 아무것도 적혀 있지 않으면 입력하라는 창이 나온다.
{
	var f=document.log_frm;
	if(f.id.value=="")
	{
	   alert("ID를 입력하세요");
	   f.id.focus();
	   return;
	}
	if(f.pw.value==""){
		alert("Password를 입력하세요");
		f.pw.focus();
		return;
	}
	f.submit();
}
</script>
<script type="text/javascript">
function join_sb(){
	//window.open("../login/join.jsp","small","width=950,heigh=700,scrollbars=yes,menubar=yes");
	//window.location.href = "../index.jsp?type=2";
	parent.location.href = "../index.jsp?type=2";
}
</script>

</head>
<body>
	<center>
	<form method=post action="../login/login_ok.jsp" name="log_frm">
		<table border=0 width=200 height=80 background="../image/login_image/log_bg.jpg">
		<p>
			<tr>
				<td width=20% align=right>ID</td>
				<td ><input type=text name=id size=14></td>
				<td rowspan=2 >	
				<a href=javascript:login2()><img src="../image/login_image/log_in.jpg" border=0></a></td>	
				</tr>
			<tr>
				<td width=20% align=right>PW</td>
				<td><input type=password name=pw size=14></td>
			</tr>
			<tr>
				
				<td colspan=3 width=20% align=right  ><input type="checkbox" >아이디 저장
				<input type=button value=회원가입 onclick="join_sb()">
				</td>			
			</tr>
		</table>
		</form>
	</center>
</body>
</html>