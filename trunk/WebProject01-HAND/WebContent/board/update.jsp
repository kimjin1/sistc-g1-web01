<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
<jsp:useBean id="dao" class="com.db.BoardDAO"/>
<%	
    String strNo=request.getParameter("no");
    String strPage=request.getParameter("page");
  	BoardVO vo=
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
	if(f.name.value=="")
	{
		alert("이름을 입력하세요");
		f.name.focus();
		return;
	}
	
	if(f.subject.value=="")
	{
		alert("제목을 입력하세요");
		f.subject.focus();
		return;
	}
	
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
<form method=post action="../board/update_ok.jsp" name=frm>
	<table border=0 width=600>
		<tr>
	   		 <td width=20% bgcolor=cccccc align="left">제목</td>
       		 <td align=left colspan=4><input type=text name=subject size=50 value="<%=vo.getSubject() %>">
       		
       		 </td>
        </tr>
        <tr>
        	<td width=15% align=left bgcolor=cccccc>이름</td>
        	<td width=25% align="left"><input type=text name=name size=15  readonly="readonly" value=<%=vo.getName() %>>
        	<input type=hidden name=no value=<%=strNo %>>
           <input type=hidden name=page value=<%=strPage %>>
        	</td>
        	
        	<td width=15% align=left bgcolor=cccccc>Email</td>
        	<td width=45% align="left"><input type=text name=email size=40 readonly="readonly" value=<%=vo.getEmail() %>>
        	</td>
        </tr>
        
        <tr>
       	 	<td align=left colspan=4 valign=top height=200>
        	 	<textarea rows="15" cols="80" name=content><%=vo.getContent() %></textarea>
        	 	<input type="hidden" name=id value="<%=session.getAttribute("id")%>">
        	</td>
       </tr>
     
       
	</table>
	
	<table border=0 width=600>
	
	  <tr>
          <td align="left" width="12%" bgcolor="cccccc">비밀번호</td>
      
          <td align="left"  width="88%"  >
           <input type=password name=pw size=10>
          </td>
         </tr>
          
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