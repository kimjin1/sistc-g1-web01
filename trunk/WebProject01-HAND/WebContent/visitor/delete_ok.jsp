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
     //delete.jsp���� �Ѱ��� �����͸� �޴´� (no,page,pwd)
     //DAO�� ���� (DAO�� ����Ŭ�� �����Ŀ� ó��==�����)
	vo.setName(name);
	vo.setpw(pw);
	vo.setNo(Integer.parseInt(strNo));	
     boolean bCheck= dao.delete(vo);//DAO�����  
     //�����(1.����� Ʋ����(back),2.���� ����(list.jsp))   
     if(bCheck==true)
     {
    	response.sendRedirect("visitor.jsp?page="+strPage);  
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