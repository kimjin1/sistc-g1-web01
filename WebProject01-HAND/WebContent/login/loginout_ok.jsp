<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
        <%
		session.invalidate();//세션에 등록된 모든 정보를 지운다
		response.sendRedirect("../login/login.jsp");
		%>