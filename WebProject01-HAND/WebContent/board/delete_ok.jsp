<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
<%
    request.setCharacterEncoding("EUC-KR");
%>
<%
     String strPage=request.getParameter("page");
     String pw=request.getParameter("pw");
 
%>
<jsp:useBean id="dao" class="com.db.BoardDAO"/>
<jsp:useBean id="vo" class="com.db.BoardVO">
<jsp:setProperty name="vo" property="*"/>
</jsp:useBean>
<%
     //delete.jsp에서 넘겨준 데이터를 받는다 (no,page,pwd)
     //DAO에 전송 (DAO가 오라클과 연결후에 처리==결과값)
     boolean bCheck= dao.delete(vo, pw);//DAO결과값
     //결과값(1.비번이 틀릴때(back),2.실제 삭제(list.jsp))
     if(bCheck==true)
     {
    	response.sendRedirect("../board/board.jsp?type=1&page="+strPage); 
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