<%@page import="com.diary.DiaryCalendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.db.*,com.diary.*,java.util.*"%>

<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="dao" class="com.db.MemberDAO" />
<jsp:useBean id="vo" class="com.db.MemberVO" />
<jsp:setProperty property="*" name="vo"/>

<%
	//System.out.println(vo.toString());
	String photo = request.getParameter("path");
	vo.setPhoto(photo);
	dao.updateMemberData(vo);
%>

<html>
<head>
<script type="text/javascript">
	function refreshIndex() {
		top.location.href = "../index.jsp?type=1";
	}
</script>
</head>
<body onload="refreshIndex()">
</body>
</html>


