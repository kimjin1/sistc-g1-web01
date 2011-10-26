<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
<%
    request.setCharacterEncoding("EUC-KR");
%>
<%
	String pw=request.getParameter("pw");
%>
<jsp:useBean id="dao" class="com.db.BoardDAO"/>
<jsp:useBean id="vo" class="com.db.BoardVO">
<jsp:setProperty name="vo" property="*"/>
</jsp:useBean>
 <%
 
    String strPage=request.getParameter("page");
   
	boolean pCheck = dao.update(vo, pw);
	if(pCheck==true){
		
		//업데이트실행
	 response.sendRedirect("../board/board.jsp?type=1&page="+strPage);
				
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