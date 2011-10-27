<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
     
     String type=request.getParameter("type");
     if(type==null)
    	 type="1";
     
     int no=Integer.parseInt(type);
     String jsp="join.jsp";
     switch(no)
     {
     case 1: jsp="../board/list.jsp";break;
     case 2: jsp="../board/write.jsp"; break;
     case 3: jsp="../board/content.jsp";break;
     case 4: jsp="../board/update.jsp";break;
     case 5: jsp="../board/delete.jsp";break;
     case 6: jsp="../common/reply.jsp";break;
        
     }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<center>
    <table border=1 width=700 height=600>
      <tr>
       <td align="left" valign="top">
        
          <jsp:include page="<%=jsp %>"></jsp:include>
        </td>
      </tr>
    </table>
  </center>
</body>
</html>