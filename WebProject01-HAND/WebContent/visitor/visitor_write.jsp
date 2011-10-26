<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function send(){
	
	var f=document.visitor_frm;
	if(f.subject.value=="")
		{
			alert("이름을 입력하세요");
			f.subject.focus();
			return;
		}
	
	
	if(f.content.value=="")
	{
		alert("내용을 입력하세요");
		f.content.focus();
		return;
	}
	f.submit();
}
</script>
</head>
<body>
	<center>
	
		<h1>방명록 쓰기</h1>
		<form method=post action="visitor_write_ok.jsp"name="visitor_frm">
		<table border=0  width=500 bgcolor=f5f0c5>
		<%--
			<tr>
				<td align=right width=20%>글 속성</td>
				<td align=left width=80%>
				<select name=num>
					<option value="1">일반</option>
					<option value="2">비공개</option>
				
				</select>
				</td>
			</tr>
			--%>
			
		
			<tr>
				<td align=right width=50%>작성자</td>
				<td align=left width=30%>
				<input type=text name=name size=10>
				</td>
			</tr>
			<tr>
			<td align=right width=50%>홈페이지</td>
			<td align=left width=30%>
			<input type=text name=homepage size=25></td>
			</tr>
			
			<tr>
				<td align=right width=20% valign=top>내용</td>
				<td align=left width=80%>
				<textarea rows="12" cols="55" name=content></textarea>
				</td>
			</tr>
			
			<tr>
				<td align=center colspan=2>
				<input type=submit value="등록" onclick="send()">
				<input type=button value="취소" onclick="javascript:history.back()">
				</td>
			</tr>
		</table>
		</form>
	</center>
</body>
</html>