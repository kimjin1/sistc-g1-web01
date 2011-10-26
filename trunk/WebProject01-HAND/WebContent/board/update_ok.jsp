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
   
	boolean pCheck = dao.isPwCheck(vo.getId(), pw);
	if(pCheck==true){
		System.out.print("엡데이트 실행");
		//업데이트실행
	 response.sendRedirect("../board.jsp?type=1&page="+strPage);
				
	}
	
 %>