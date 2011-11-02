<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
<jsp:useBean id="dao" class="com.db.PhotoDAO"/>
<%
   //게시물 번호
   String strNo=request.getParameter("no");
System.out.println(strNo);
   PhotoVO vo= 
		   dao.getContent(Integer.parseInt(strNo));
   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <center>
     <p>
     <img src="../include/image/title.gif" width=600 height=50>
     <p>
     <table width=600 border=1 bordercolor=#ccccff>
      <tr height=25>
        <td width=20% bgcolor=#ccccff>이름</td>
        <td width=30%><%=vo.getNo() %></td>
        <td width=20% bgcolor=#ccccff>작성일</td>
        <td width=30%><%=vo.getRegdate().toString() %></td>
      </tr>
    
      <%
         if(vo.getFilesize()!=0)
         {
      %> 
      <tr height=25>
        <td width=20% bgcolor=#ccccff>첨부파일</td>
        <td align=left colspan=3>
         <a href="../Photo/download.jsp?fn=<%=vo.getFilename()%>">
         <%=vo.getFilename() %>
         </a>
        (<%=vo.getFilesize() %>)Bytes
        </td>
      </tr>
      <%
         }
      %>
      <tr>
        <td align=left colspan=4 valign=top height=200>
         <pre><%=vo.getContent() %></pre>
        </td>
      </tr>
     </table>
     <table border=0 width=600>
      <tr>
       <td align=right>
        <a href="#">
        <img src="../include/image/modify.gif" border=0>
        </a>
        <a href="#">
        <img src="../include/image/detete.gif" border=0>
        </a>
        <a href="javascript:history.back()">
        <img src="../include/image/list.gif" border=0>
        </a>
       </td>
      </tr>
     </table> 
    </center>
</body>
</html>
