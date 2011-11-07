<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*,java.util.*"%>
<%
   request.setCharacterEncoding("EUC-KR");
   String fs=request.getParameter("fs");
   String ss=request.getParameter("ss");
   String strPage=request.getParameter("page");
   
   BoardDAO dao=new BoardDAO();
   int count=dao.getFindCount(fs, ss);
   ArrayList<BoardVO> list=null;
   
   if(count!=0)
   {
	   list=new ArrayList<BoardVO>();
	   list=dao.getFindData(fs, ss);
   }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
a{text-decoration: none;color:black}
 a:hover{text-decoration: underline;color:green}
</style>
<script type="text/javascript">
var click=0;
function open(id)
{
	var p=document.getElementById(id);
	if(click==0)
	{
		p.style.display='';
		click=1;
	}
	else
	{
		p.style.display='none';
		click=0;
	}
}
</script>
</head>
<body>
	<center>
    <p>
    <p>
    <p>
    <table border=0 width=600>
     <tr>
      <td align=left>
       <a href="javascript:history.back()">
       <img src="../image/board/main.jpg" border=0>
       </a>
      </td>
     </tr>
    </table>
    <%
       if(count==0)
       {
    %>
          <table border=0 width=600>
           <tr>
            <td><font color=red><h2>검색결과가 없습니다</h2></font>
           </tr>
          </table>
    <% 
       }
       else
       {
    %>
    <table border=0 width=600 cellpadding="0" cellspacing="0">
      <tr bgcolor=cccccc>
       <th width=10%>번호</th>
       <th width=45%>제목</th>
       <th width=15%>이름</th>
       <th width=20%>작성일</th>
       <th width=10%>조회수</th>
      </tr>
      
      <%
         for(BoardVO vo:list)
         {
      %>
            <tr height=25>
              <td width=10%><%=vo.getNo() %></td>
              <td width=45% align=left>
               <a href="board.jsp?type=3&no=<%=vo.getNo() %>">
               <%=vo.getSubject() %>
               </a>
              </td>
              <td width=15%><%=vo.getName() %></td>
              <td width=20%>
                <%=vo.getRegdate().toString() %>
              </td>
              <td width=10%><%=vo.getReadnum() %></td>
            </tr>
            <tr id="m<%=vo.getNo() %>" style="display:none">
              <td colspan=5 align=left valign=top>
               <hr>
                <pre><%=vo.getContent() %></pre>
               <hr>
              </td>
            </tr>
      <%
         }
      %>
     </table>
     <%
       }
     %>
     <hr width=600>
  </center>
</body>
</html>