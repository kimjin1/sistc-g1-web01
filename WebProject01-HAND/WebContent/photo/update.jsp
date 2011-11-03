<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
<jsp:useBean id="dao" class="com.db.PhotoDAO"/>
<%	
    String strNo=request.getParameter("no");
    String strPage=request.getParameter("page");
  	PhotoVO vo=
       dao.getUpdateData(Integer.parseInt(strNo));
  	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	if(f.pw.value=="")
	{
		alert("비밀번호를 입력하세요");
		f.pw.focus();
		return;
	}
	
	
	//전송 (데이터를 action에게 전송)
	f.submit();//<input type=submit>
	//<input type=image>:submit
}
</script>
</head>
<body>
<center>
<form method=post action="update_ok.jsp" name=frm>
	<table border=5 width=800>
		
        
        <tr>
       	 	<td align=left colspan=4 valign=top height=200>
        	 	<textarea rows="25" cols="50" name=content><%=vo.getContent() %></textarea>
        	 	<input type="hidden" name=id value="<%=session.getAttribute("id")%>">
        	 	<input type="hidden" name="no" value="<%=strNo%>">
        	 	<input type="hidden" name="page" value="<%=strPage%>">
        	</td>
       </tr>
       <tr>
          <td align=right width=20%>비밀번호</td>
          <td align=left width=80%>
           <input type=password name=pw size=10>
          </td>
       
	</table>
	<table border=5 width=800>
		<tr>
		   <td align=center colspan=2>
          	 <input type=button value=수정 onclick="send()" >
          	 <input type=button value=목록 
             onclick="javascript:history.back()">
          </td>
         </tr>
	</table>
	</form>
</center>
</body>
</html>