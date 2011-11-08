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
	var id = "<%=id%>";
	if(id=="null"){
		alert("로그인 하세요");
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
	var num = <%=list.size()%>
	if(num==0){
		alert("답글이 없습니다.");
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
		alert("선택된 항목이 없습니다");		
	}
	
		
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

		<table width=600 border=0 bordercolor=cccccc height=100>
			<tr>
				<td align="left"  bgcolor=cccccc><a href="javascript:openclose()">답글보기</a></td>
			</tr>
			<tr>
				
				<td align=left  valign=top><textarea rows="4"
						cols="75" name=content></textarea>
				<input type="hidden" name="id" value="<%=session.getAttribute("id")%>">
				<input type="hidden" name="flag" value="<%=flag%>">
				<input type="hidden" name="rootno" value="<%=rootno%>">
						</td>
						
               	<td width=15% align=right bgcolor="cccccc"><input type=button value=등록 size=20 onclick="send()">
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