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
//이게 DAO VO 가 틀려서 그런거아냐? 저그럴ㄷ스...케이스 문 가따쓰는건 보드jsp 저건 보드 D없다. 위에.

//DAO에 데이터를 전송(VO)
	//insert 요청
	//dao.replyinsert(vo); 
	//list.jsp이동
	response.sendRedirect("../board/board.jsp?type=3");
%>
