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
	System.out.println(vo.getNo()+":"+vo.getSubject()+":"+vo.getContent());
    //DAO�� �����͸� ����(vo)
    //insert ��û
    dao.insert(vo);
    //list.jsp�̵�
    response.sendRedirect("board.jsp?type=1");
%>
