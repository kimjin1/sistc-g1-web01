<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
<jsp:useBean id="dao" class="com.db.BoardDAO"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function send()
{
	var f=document.frm;
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
		
	
	f.submit();
	
}
</script>
</head>
<body>
<center>
 <form method=post action="../board/write_ok.jsp" name=frm>
	<table border=0 width=600>
		<tr>
	   		 <td  align="left" width="20%" bgcolor=cccccc>제목</td>
       		 <td  align="left" width="80%" colspan=3><input type=text name=subject size=55>
       		 </td>
        </tr>
        <tr>
        	<td  align=left width="20%" bgcolor=cccccc>이름</td>
        	<td align="left"><input type=text name=name size=10 value="<%=session.getAttribute("name")%>">
        	</td>
        	
        	<td  align=left width="20%" bgcolor=cccccc>Email</td>
        	<td  align=left><input type=text name=email size=30 value="<%=session.getAttribute("email")%>">
        	</td>
        </tr>
        
        <tr>
       	 	<td align=left  colspan=4 valign=top height=200>
        	 	<textarea rows="15" cols="80" name=content></textarea>
        	 	<input type="hidden" name="id" value="<%=session.getAttribute("id")%>">
        	</td>
       </tr>
       
	</table>
	<table border=0 width=600>
		
       <tr>
          <td align=center colspan=4>
           <input type=button value=글쓰기 onclick="send()">
           <input type=button value=취소 
             onclick="javascript:history.back()">
          </td>
         </tr>
	</table>
	</form>
</center>
</body>
</html>