<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
    
    <%
    String id=request.getParameter("id");
    String pw=request.getParameter("pw");
    
    //DB
    MemberDAO dao=MemberDAO.newInstance();
    String result=dao.isLogin(id,pw);
    
    int admin=dao.isAdmin(id);
    
    
    if(result.equals("NOID")){
%>
       <script>
       alert("ID�� �������� �ʴ´�");
       history.back();
       </script>
<%
    }
    else if(result.equals("NOPWD")){
%>
        <script>
        alert("Password�� Ʋ���ϴ�");
        history.back();
        </script>
<%   	 
    }
    else
    {
        session.setAttribute("id", id);
        session.setAttribute("name", result);
        session.setAttribute("admin", admin);
        
        response.sendRedirect("../login/logout.jsp");
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