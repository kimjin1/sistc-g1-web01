<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
    <%
    	request.setCharacterEncoding("euc-kr");
    %>
<jsp:useBean id="dao" class="com.db.ReplyDAO"/>
<jsp:useBean id="vo" class="com.db.ReplyVO">
<jsp:setProperty name="vo" property="*"/>
</jsp:useBean>



<%
//�̰� DAO VO �� Ʋ���� �׷��žƳ�? ���׷�����...���̽� �� �������°� ����jsp ���� ���� D����. ����.
	System.out.println(vo.toString());
//DAO�� �����͸� ����(VO)
	//insert ��û
	dao.replyinsert(vo); 
	//list.jsp�̵�
	response.sendRedirect("../board/board.jsp?type=3&no="+vo.getRootno()+"&page=1");
%>
