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
    <img src="../include/image/visitor.gif" width=600 height=50>
    <p>
    <table border=0 width=800>
     <tr>
      <td align=left>
       
       <img src="../image/board/write.jpg" border=0>
      
      </td>
     </tr>
    </table>
  
      <%
         for(VisitorVO vo:list)
         {
      %>
    <table border=0 width=800>
        <tr height=25 bgcolor=#ccccff>

	        <td width=15%>No.<%=vo.getNo() %></td>
	        <td width=15%><%=vo.getName() %></td>
	        <td width=30%><%=vo.getRegdate() %></td>
       		
		</tr>     
	    <tr height=65 bgcolor=cccccc>
	        <td width=45% colspan="3" align=left><%=vo.getContent() %>
	        
	        </td>
	   </tr> 
	</table>
	<%
         }
	%>
	<p>
	<p>
	<p>
	

    <table border=5 width=800>
      <tr>
       <td align=left width=40%>이름
       
        <input type=text name=ss size=15>
        <input type=hidden name=page 
                 >
        <input type=button value=찾기 >
       </td>
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