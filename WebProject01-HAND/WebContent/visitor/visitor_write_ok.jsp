<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
    <%
    	request.setCharacterEncoding("euc-kr");
    %>
    <jsp:useBean id="dao" class="com.db.VisitorDAO"/>
<jsp:useBean id="vo" class="com.db.VisitorVO">
<jsp:setProperty name="vo" property="*"/>
</jsp:useBean>



<%
	//DAO�� �����͸� ����(VO)
	//insert ��û
	dao.insert(vo);
	//list.jsp�̵�
	response.sendRedirect("visitor.jsp");
%>