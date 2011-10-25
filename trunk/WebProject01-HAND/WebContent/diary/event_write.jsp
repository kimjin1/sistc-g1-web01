<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function event_write(){
	var frm = document.event_frm;
	if(frm.subject.value=""){
		alert("제목을 입력하세요");
		frm.subject.focus();
		return;
	}
	frm.submit();
}
</script>
</head>
<body>
	<center>
		<table border=0 width=400 height=380 bgcolor="white">
			<tr>
				<td valign="top">
					<form method=post action="event_write_ok.jsp" name="event_frm">
					<table width=100% height=100% border=0>
						<tr>
							<td colspan=2 height=10% align="center">
								<%-- 년,월,일까지 자동표시 시, 분을 선택 --%>
							${param.year }. ${param.month }. ${param.day }.
							&nbsp;&nbsp;&nbsp;&nbsp;  	 
							<select name="hour">							
									<c:forEach var="i" begin="1" end="24" step="1">
										<option>${i }시</option>
									</c:forEach>
							</select>  
							<select name="minute">
									<c:forEach var="i" begin="0" end="59" step="1">
										<option>${i }분</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td colspan=2>
								<hr>
							</td>
						</tr>
						<tr>
							<td width=16%>제목</td>
							<td width=76%><input type=text name=subject size=45>
							</td>
						</tr>
						<tr>
							<td width=20% valign="top">내용</td>
							<td width=80%><textarea rows=16 cols=43 name=content></textarea>
							</td>
						</tr>
						<tr>
							<td colspan=2>
								<hr>
							</td>
						</tr>						
						<tr>
							<td colspan=2 align="center">							
								<input type="button" value="입력" onclick="event_write()">
									&nbsp;&nbsp;
								<input type="button" value="취소" onclick="javascript:history.back()">								 
							</td>
						</tr>
					</table>
					</form>
					</td>
			</tr>
		</table>
	</center>
</body>
</html>