<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
<%
    request.setCharacterEncoding("EUC-KR");
%>
<%
     String strNo=request.getParameter("no");
     String strPage=request.getParameter("page");
     String pw=request.getParameter("pw");
%>
<jsp:useBean id="dao" class="com.db.BoardDAO"/>
<jsp:useBean id="vo" class="com.db.BoardVO">
<jsp:setProperty name="vo" property="*"/>
</jsp:useBean>
<%
     //delete.jsp���� �Ѱ��� �����͸� �޴´� (no,page,pwd)
     //DAO�� ���� (DAO�� ����Ŭ�� �����Ŀ� ó��==�����)
     boolean bCheck= dao.delete(vo, pw);//DAO�����
     //�����(1.����� Ʋ����(back),2.���� ����(list.jsp))
     if(bCheck==true)
     {
    	response.sendRedirect("../board/board.jsp?type=1&page="+strPage); 
     }
     else
     {
%>
        <script>
        alert("��й�ȣ�� Ʋ���ϴ�");
        history.back();
        </script>
<% 
     }
%>