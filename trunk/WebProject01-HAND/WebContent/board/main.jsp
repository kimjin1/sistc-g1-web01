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
    <table border=0 width=800 >
     <tr>
      <td align=left>
         <img src="../include/image/write.gif" border=0>
        </td>
     </tr>
    </table>
    <table border=0 width=800 height=10 cellpadding="0" cellspacing="3">
      <tr bgcolor=#ccccff>
       <th width=10%>번호</th>
       <th width=15%>제목</th>
       <th width=45%>이름</th>
       <th width=20%>작성일</th>
       <th width=10%>조회수</th>
      </tr>
     
           
	
    </table>
    <hr width=800>
    
    <table border=0 width=800>
      <tr align=center>
       <td align=center>
     
         <img src="../include/image/prev.gif" border=0>
      
       
         <img src="../include/image/next.gif" border=0>
        
       
         &nbsp;&nbsp;&nbsp;
          page /  pages
       </td>
       </tr>
       <tr >
       <td align=center>
        <select name=fs>
         <option value=name>이름</option>
         <option value=subject>제목</option>
         <option value=content>내용</option>
        </select>
        <input type=text name=ss size=15>
        <input type=hidden name=page>
        <input type=button value=찾기>
       </td>
      </tr>
    </table>
   
   </center>
</body>
</html>