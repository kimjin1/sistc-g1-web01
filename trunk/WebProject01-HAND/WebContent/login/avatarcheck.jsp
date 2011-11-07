<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
    <jsp:useBean id="dao" class="com.db.MemberDAO"/>
     <%
    	//String photo=request.getParameter("photo");
  	 	 
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>


<script type="text/javascript">	

function ok(){
		parent.frm.id.value=document.frm.photo.value;
		parent.Shadowbox.close();
	}

/*
	function idcheck(){
		var f=document.frm;
		if(f.id.value==""){
			alert("ID를 입력하세요");
			f.id.focus();
			return;
		}
		f.submit();
	}
*/
</script>
</head>
<body>
	<center>
	<p><p><p>
	<form method=post action="../login/avatarcheck.jsp" name=frm>
		<table border=0 width=300>
			<tr>
				<td >	
				<img src="../image/avatar/character01.png" border=0>
				</td>
			</tr>
	
		</table>
		</form>
	</center>
</body>
</html>