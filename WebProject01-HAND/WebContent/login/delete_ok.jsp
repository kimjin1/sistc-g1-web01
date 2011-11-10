<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
<html>
<head>
<script type="text/javascript">
function pwright(){
	top.location.href = "../index.jsp?type=1";
}
function pwwrong(){
	top.location.href = "../index.jsp?type=4";	
}
</script>
</head>
<body>
</body>
</html>    
    <%
    		String id =request.getParameter("id");
    		String pw =request.getParameter("pw");
    		
    		MemberDAO dao = new MemberDAO();
    		boolean bcheck = dao.delete(pw, id);
    		
    		if(bcheck==true)
    		{
    			session.invalidate();
    			%>
    			<script type="text/javascript">
    				alert("Å»Åð µÇ¾ú½À´Ï´Ù.¸Þ·Õ...");
    				pwright();
    			</script>
    			<%
    		}
    		else
    		{
    			%>
    			<script type="text/javascript">
    				alert("Áö ºñ¹Ð¹øÈ£µµ ¸ð¸£´Â°Ô ¹«½¼ Å»Åð´Â..");
    				pwwrong();
    			</script>
    			<%
    			
    		}
    		

    %>
