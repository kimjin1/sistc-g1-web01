<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*,com.db.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="dao" class="com.db.ReplyDAO" />
<%
	int flag=Integer.parseInt(request.getParameter("flag"));
	int rootno=Integer.parseInt(request.getParameter("rootno"));
	
	
	
	ArrayList<ReplyVO> list = dao.getReplyData(flag,rootno);
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
		alert("������ �Է��ϼ���");
		f.content.focus();
		return;
	}
		
	
	f.submit();
	
} 
</script>
<script type="text/javascript">
function openclose()
{
	var p=document.getElementById("rep");
	// p <tr>
	if(p.style.display=='none')
	{
		p.style.display='';
	}
	else
	{
		p.style.display='none';
	}
}
function del(){
	document.no_frm.submit();
}
</script>
</head>
<body>
	<center>
	<form method=post action="../common/reply_writeok.jsp" name=frm>
		<%--
			/*
			 ���� jsp�� �۾�����
			 ���배�� ����
			 �Է����� ����� ��� ��ư�� ������ ���� ok�� �Ѿ�� content�� �ٽ� �Ѹ���.
		 */
		--%>

		<table width=600 border=5 bordercolor=cccccc height=100>
			<tr>
				<td width=15% bgcolor=cccccc><a href="javascript:openclose()">��۾���</a></td>
				<td align=left colspan=4 valign=top><textarea rows="5"
						cols="85" name=content></textarea>
				<input type="hidden" name="id" value="<%=session.getAttribute("id")%>">
				<input type="hidden" name="flag" value="<%=flag%>">
				<input type="hidden" name="rootno" value="<%=rootno%>">
						</td>
						
				<td width=15% align=right><input type=button value=��� size=20 onclick="send()">
				</td>
			</tr>
		</table>
		</form>

		<table id="rep" width="600" border="0" style="display:none">

			<tr>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<%
				for (ReplyVO vo : list) {
			%>
			<tr id="re<%=vo.getNo()%>" height=15>				
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