<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
    
    <%
    String id=request.getParameter("id");
    String pwd=request.getParameter("pwd");
    
    //DB
    MemberDAO dao=MemberDAO.newInstance();
    String result=dao.isLogin(id,pwd);
    
    int admin=dao.isAdmin(id);
    
    
    if(result.equals("NOID")){
%>
       <script>
       alert("ID가 존재하지 않는다");
       history.back();
       </script>
<%
    }
    else if(result.equals("NOPWD")){
%>
        <script>
        alert("Password가 틀립니다");
        history.back();
        </script>
<%   	 
    }
    else
    {
        session.setAttribute("id", id);
        session.setAttribute("name", result);
        session.setAttribute("admin", admin);
        
        response.sendRedirect("main.jsp?no=1");
    }
	
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>