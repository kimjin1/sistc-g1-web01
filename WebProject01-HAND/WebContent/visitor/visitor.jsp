<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,com.db.*,java.text.*"%>
    
    
    <%
   VisitorDAO dao=new VisitorDAO();
    ArrayList<VisitorVO> list= 
    		         dao.getVisitorData();    
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
  
    <p>
    <table border=0 width=400>
     <tr>
      <td align=left>
       
       <a href="visitor_write.jsp"><img src="../image/board/write.jpg" border=0></a>
      
      </td>
     </tr>
    </table>
  
      <%
         for(VisitorVO vo:list)
         {
      %>
      <p>
    <table border=3 width=400 bgcolor=f5f0c5>
        <tr height=20 bgcolor=#ccccff>

	        <td width=15%>No.<%=vo.getNo() %></td>
	        <td width=15%><%=vo.getName() %></td>
	        <td width=30%><%=vo.getRegdate() %></td>
       		
		</tr>     
	    <tr height=65 >
	        <td width=45% colspan="3" align=center><%=vo.getContent() %>
	        </td>
	        <tr>
	       
	        <td align=right colspan=3>
	        <input type=button value=삭제>
	        </td>
	   </tr> 

	</table>
	<p>
	<%
         }
	%>
	<p>
	<p>
	<p>
	

    <table border=5 width=400>
      <tr>
      
       <td align=right>
     <img src="../image/board/prev.jpg" border=0>
    
         &nbsp;
      
         <img src="../image/board/next.jpg" border=0>
         
      
         &nbsp;&nbsp;&nbsp;

       </td>
      </tr>
    </table>
   
   </center>
</body>
</html>