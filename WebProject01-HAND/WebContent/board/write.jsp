<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<center>
	<table border=5 width=800>
		<tr>
	   		 <td width=20% bgcolor=cccccc>제목</td>
       		 <td align=left colspan=3>&nbsp;</td>
        </tr>
        <tr>
        	<td width=15% align=left bgcolor=cccccc>이름</td>
        	<td width=25%></td>
        	
        	<td width=15% align=left bgcolor=cccccc>Email</td>
        	<td width=45%></td>
        </tr>
        
        <tr>
       	 	<td align=left colspan=4 valign=top height=200>
        	 	<pre></pre>
        	</td>
       </tr>
       
	</table>
	<table border=5 width=800>
		<tr>
       	<td width=15% bgcolor=cccccc>비밀번호</td>
       	<td width=25%></td>
       	<td width=60%></td>
       </tr>
       <tr>
          <td align=center colspan=3>
           <input type=button value=등록>
           <input type=button value=취소 
             onclick="javascript:history.back()">
          </td>
         </tr>
	</table>
</center>
</body>
</html>