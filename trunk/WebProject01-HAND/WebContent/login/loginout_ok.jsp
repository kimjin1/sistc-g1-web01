<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
        <%
		session.invalidate();//���ǿ� ��ϵ� ��� ������ �����
		response.sendRedirect("../login/login.jsp");
		%>