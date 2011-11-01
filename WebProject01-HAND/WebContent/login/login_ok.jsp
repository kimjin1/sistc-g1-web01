<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
    
    <%
    String id=request.getParameter("id");
    String pw=request.getParameter("pw");
    
    //DB
    MemberDAO dao=MemberDAO.newInstance();
    String result=dao.isLogin(id,pw);
    String temp[] = result.split(":");
    String name = temp[0];
    String email = temp[1];		
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
        session.setAttribute("name", name);
        session.setAttribute("admin", admin);
        session.setAttribute("email", email);        
        
        //response.sendRedirect("../index.jsp?no=1");        
        //  response.sendRedirect("../login/logout.jsp");
    }
	
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function refreshIndex(){
	parent.location.href = "../index.jsp?type=1";
}
</script>
</head>
<body onload="refreshIndex()">

</body>
</html>