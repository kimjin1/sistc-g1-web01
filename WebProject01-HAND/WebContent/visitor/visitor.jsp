<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,com.db.*,java.text.*"%>
    <%!
     int totalpage=0;//총페이지(DB)
     int curpage=1;//현재(수시로 변경)
     
     int back;//이전값
     int forward;//다음값
%>

    

  <jsp:useBean id="dao" class="com.db.VisitorDAO"/>
  <%
    String strPage=request.getParameter("page");
    if(strPage==null)
    	strPage="1";
    curpage=Integer.parseInt(strPage);
    ArrayList<VisitorVO> list=dao.getVisitorData(curpage);    
    totalpage=dao.getTotalPage();
    int count=dao.getBoardCount(); 
    count=count-((curpage*10)-10);
    //    30 1-(0) 2-(10) 3-(20) 
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
    <table border=0 width=400   cellpadding="6" background="../image/visitor/visitor2.png" >
        <tr height=20 >

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
        <%
            if(curpage>1)
            {
            	back=curpage-1;
         %>
       <a href="../visitor/visitor.jsp?page=<%=back%>">
     <img src="../image/board/prev.jpg" border=0>
    	</a>
    	<%
            }
         %>
         &nbsp;
         <%
            for(int i=1;i<=totalpage;i++)
            {
         %>
               [<a href="../visitor/visitor.jsp?page=<%=i%>"><%=i %></a>]
         <%
            }
         %>
         <%
             if(curpage<totalpage)
             {
            	 forward=curpage+1;
         %>
      	<a href="../visitor/visitor.jsp?page=<%=forward %>">
         <img src="../image/board/next.jpg" border=0></a>
         <%
             }
         %>
      
         &nbsp;&nbsp;&nbsp;
  <%=curpage %> page / <%=totalpage %> pages
       </td>
      </tr>
    </table>
   
   </center>
</body>
</html>