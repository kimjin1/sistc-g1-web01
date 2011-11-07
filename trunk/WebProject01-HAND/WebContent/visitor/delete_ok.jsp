<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
<%
    request.setCharacterEncoding("EUC-KR");
%>
<%
	String name = request.getParameter("name");
     String strNo=request.getParameter("no");
     String strPage=request.getParameter("page");
     String pw=request.getParameter("pw");	   
     System.out.println(strNo+"|"+strPage+"|"+pw+"|"+name);
%>
<jsp:useBean id="dao" class="com.db.VisitorDAO"/>
<jsp:useBean id="vo" class="com.db.VisitorVO">
</jsp:useBean>
<%
     //delete.jsp에서 넘겨준 데이터를 받는다 (no,page,pwd)
     //DAO에 전송 (DAO가 오라클과 연결후에 처리==결과값)
	vo.setName(name);
	vo.setpw(pw);
	vo.setNo(Integer.parseInt(strNo));	
     boolean bCheck= dao.delete(vo);//DAO결과값  
     //결과값(1.비번이 틀릴때(back),2.실제 삭제(list.jsp))   
     if(bCheck==true)
     {
    	response.sendRedirect("visitor.jsp?page="+strPage);  
     }
     else
     {
%>
        <script>
        alert("비밀번호가 틀립니다");
        history.back();
        </script>
<% 
     }
%>