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
    <p>
    <p>
    <p>
    
    <table border=0 width=300>
      <tr>
       <td width=30%>비밀번호</td>
       <td width=70% align=left>
        <input type=password name=pwd size=15>
        <input type=hidden name=no 
                  value=>
        <input type=hidden name=page 
                  value=>
       </td>
      </tr>
      <tr>
       <td colspan=2 align=center>
        <input type=button value=삭제 onclick="del()">
        <input type=button value=취소 
          onclick="javascript:history.back()">
       </td>
      </tr>
    </table>
    </center>
</body>
</html>