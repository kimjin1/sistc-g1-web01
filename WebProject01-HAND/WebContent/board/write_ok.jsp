<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
<%
   request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="dao" class="com.db.BoardDAO"/>
<jsp:useBean id="vo" class="com.db.BoardVO">
 <jsp:setProperty name="vo" property="*"/>
</jsp:useBean>
<%
	
    //DAO에 데이터를 전송(vo)
    //insert 요청
    
    dao.insert(vo);
    //list.jsp이동
    response.sendRedirect("board.jsp?type=1");
%>
