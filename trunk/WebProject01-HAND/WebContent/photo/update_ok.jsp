<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
<%
    request.setCharacterEncoding("EUC-KR");
%>
<%
	String pw=request.getParameter("pw");
%>
<jsp:useBean id="dao" class="com.db.PhotoDAO"/>
<jsp:useBean id="vo" class="com.db.PhotoVO">
<jsp:setProperty name="vo" property="*"/>
</jsp:useBean> 
 <%
 	
    String strPage=request.getParameter("page");
   
	boolean pCheck = dao.update(vo, pw);
	if(pCheck==true){
		
		//업데이트실행
		System.out.println("uok:"+strPage+"|"+vo.getNo());
	 response.sendRedirect("photo.jsp?page="+strPage+"&no="+vo.getNo());
				
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