<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*,com.db.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="dao" class="com.db.ReplyDAO" />
<%
	//int flag=Integer.parseInt(request.getParameter("flag"));
	//int rootno=Integer.parseInt(request.getParameter("rootno"));
	String strFlag = request.getParameter("flag");
	String strNo = request.getParameter("rootno");
	
	System.out.println(strFlag+"|"+strNo);
	ArrayList<ReplyVO> list = dao.getReplyData(1);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function send()
{
	var f=document.frm;
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
	<form method=post action="../common/reply_writeok.jsp" name=frm>
		<%--
			/*
			 리플 jsp에 글쓰기모양
			 내용같이 생성
			 입력폼을 만들고 등록 버튼을 누르면 리플 ok로 넘어가서 content로 다시 뿌린다.
		 */
		--%>

		<table width=800 border=5 bordercolor=cccccc height=100>
			<tr>
				<td width=15% bgcolor=cccccc>답글쓰기</td>
				<td align=left colspan=4 valign=top><textarea rows="5"
						cols="85" name=content></textarea>
				<input type="hidden" name="id" value="<%=session.getAttribute("id")%>">
				<input type="hidden" name="flag" value="<%=session.getAttribute("flag")%>">
				<input type="hidden" name="curNo" value="<%=session.getAttribute("curNo")%>">
						</td>
						
				<td width=15% align=right><input type=button value=등록 size=20 onclick="send()">
				</td>
			</tr>
		</table>
		</form>

		<table width="600" border="0">

			<tr>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<%
				for (ReplyVO vo : list) {
			%>
			<tr height=15>
				<td width=5%><%=vo.getNo()%></td>
				<td width=10%><%=vo.getId()%></td>
				<td width=70%><%=vo.getContent()%></td>
				<td width=15%><%=vo.getRegdate().toString()%></td>

			</tr>
			<%
				}
			%>


		</table>
		
	</center>
</body>
</html>