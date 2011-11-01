<%@page import="com.diary.DiaryCalendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*, com.diary.*, java.util.*"%>
    
    <%
    request.setCharacterEncoding("euc-kr");
    
    String id=request.getParameter("id");
    String pw=request.getParameter("pw");
    String name=request.getParameter("name");
  	String year=request.getParameter("year");
  	String month=request.getParameter("month");
  	String day=request.getParameter("day");
    String nickname=request.getParameter("nickname");
    String memo=request.getParameter("memo");
    String email=request.getParameter("email");
    String photo=request.getParameter("photo");
    String homepage=request.getParameter("homepage");
    
  
  	
    
    %>
    <jsp:useBean id="dao" class="com.db.MemberDAO"/>
    <jsp:useBean id="vo" class="com.db.MemberVO"/>
    
    
    <%
    DiaryCalendar cal = DiaryCalendar.getInstance();
    Date birth = cal.valueToDate(year, month, day);
    
    vo.setId(id);
    vo.setPw(pw);
    vo.setName(name);
   	vo.setBirth(birth);
    vo.setNickname(nickname);
    vo.setMemo(memo);
    vo.setEmail(email);
    vo.setPhoto(photo);
    vo.setEmail(email);
    vo.setHomepage(homepage);
    
    
    dao.insert(vo);
    
    //response.sendRedirect("../index.jsp?type=1");
    //response.sendRedirect("../login/login.jsp?id="+vo.getId()+"&pw="+vo.getPw());
    
    //long time = vo.getBirth().getTime();
	//		   ps.setDate(3, new java.sql.Date(time));
    %>
    
    <%   	 
    
        session.setAttribute("id", id);
        session.setAttribute("name", name);
        session.setAttribute("admin", 2);
        session.setAttribute("email", email);           
    %>
    
    
<html>
<head>
<script type="text/javascript">
function refreshIndex(){
	top.location.href = "../index.jsp?type=1";
}
</script>
</head>
   <body onload="refreshIndex()">    
    </body>
</html>
