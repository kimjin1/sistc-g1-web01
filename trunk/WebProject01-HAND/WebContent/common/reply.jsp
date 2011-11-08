<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*,com.db.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="dao" class="com.db.ReplyDAO" />


<%
	String id=(String)session.getAttribute("id");
	String strPage=request.getParameter("page");
	String strNo=request.getParameter("no");
	int flag=Integer.parseInt(request.getParameter("flag"));
	int rootno=Integer.parseInt(request.getParameter("rootno"));
	String rootid = dao.getRootId(rootno, flag);
	ArrayList<ReplyVO> list = dao.getReplyData(flag,rootno);
	System.out.println("reply:"+id+"|"+rootid);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function send()
{
	var f=document.frm;
	var id = "<%=id%>";
	if(id=="null"){
		alert("�α��� �ϼ���");
		return;
	}
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

function delSelected(){
	var id = "<%=id%>";
	var rid = "<%=rootid%>";	
	if(id != rid){
		alert("�Խù� �ۼ��ڸ� ������ �� �ֽ��ϴ�")
		return;
	}	else{
		var num = <%=list.size()%>;
		if(num==0){
			alert("����� �����ϴ�.");
			return;
		}
		var check = document.del_frm.delnum;
		
		var flg = false;
		var i = 0;
		for(i=0; i<check.length; i++){
			if(check[i].checked==true){
				flg = true;
			}
		}
		if(flg==true){
			document.del_frm.submit();
		}else{
			alert("���õ� �׸��� �����ϴ�");		
		}		
	}
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

		<table width=600 border=0 bordercolor=cccccc height=100>
			<tr>
				<td align="left"  bgcolor=cccccc><a href="javascript:openclose()">��ۺ���</a></td>
			</tr>
			<tr>
				
				<td align=left  valign=top><textarea rows="4"
						cols="75" name=content></textarea>
				<input type="hidden" name="id" value="<%=session.getAttribute("id")%>">
				<input type="hidden" name="flag" value="<%=flag%>">
				<input type="hidden" name="rootno" value="<%=rootno%>">
						</td>
						
               	<td width=15% align=right bgcolor="cccccc"><input type=button value=��� size=20 onclick="send()">
				</td>
			</tr>
			
		</table>
		</form>
		<form method=post action="../common/reply_delete.jsp " name="del_frm">
		<table id="rep" width="600" border="0" style="display:none">
		<tr>
			<td>
			<input type="hidden" name="rootno" value="<%=rootno%>">
			<a href="javascript:delSelected()">
	         <img src="../image/board/delete.jpg" border=0>
	         </a>
	         </td>
		</tr>
			<tr>
				
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<%
				for (ReplyVO vo : list) {
			%>
			 
                          
			<tr id="re<%=vo.getNo()%>" height=15>
							
				<td width=10%><input type=hidden name=no value=<%=vo.getNo() %>>
				<input type=checkbox name=delnum value="<%=vo.getNo()%>"><%=vo.getId()%> 
                 
                    </td>
		                          
				<td width=70%><%=vo.getContent()%></td>
				<td width=15%><%=vo.getRegdate().toString()%></td>

			</tr>
			<%
				}
			%>


		</table>
		</form>
	</center>
</body>
</html> 