<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*, java.util.*,java.text.*"%>
<jsp:useBean id="dao" class="com.db.MainDAO"></jsp:useBean>
<jsp:useBean id="homedao" class="com.db.HomeDAO"></jsp:useBean>
    <%
    	String id=(String)session.getAttribute("id");
    	HomeVO h_vo = homedao.vo(id); //HomeDAO로 id 전송
    	    	
       	ArrayList<PhotoVO> list=dao.getPhotoData();
    	ArrayList<BoardVO> list2=dao.getBoardData(); 
    	
    	String nick=h_vo.getNickname();
    	String memo=h_vo.getMemo();
    	String photo=h_vo.getPhoto();
    	
    	String d_photo="<img src='../image/home/default.png' width=140 height=150>";
    	
    	if(id==null){
    		%><script language="javascript">
 				alert("로그인 하세요^^");
 				document.location.href = "javascript:history.back()" ;
 			</script>
<%
    	}
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
<style type="text/css">
  a{text-decoration: none;color:black}
 a:hover{text-decoration: underline;color:green}
</style>
</head>
<body>
	<center>
		<table width=600 height=200 border=0>
			<tr>
				<td width=200 align="center" valign="middle">
					<%if(photo!=null){ %>
						<img src="<%=photo %>" width="140" height="150">
					<%}else{ %>
						<%=d_photo //널포인트로 값이 넘어올 경우 디폴트 그림이 뜬다.
						%> 
					<%} %>
				</td>
				<td width=400 align="left">
					<font face="맑은고딕" size=5 color="Blue"><%=nick %></font>&nbsp;님 즐거운 하루!!
					<br><br><P>
					<%=memo %>
				</td>
			</tr>
		</table>
		<hr border=20 width=500 color="gray">
		<table width=600 height=100 border=0>
			<tr>
<%
			 for(PhotoVO vo:list){
%>
			<td>
			<table width=100% border=0 align="center">
				<tr>
					<td width=100 height=80><a href="../photo/content.jsp?no=<%=vo.getNo()%>"><img src="../photo/upload/<%=vo.getFilename()+"_tn.jpg"%>" border=0></a></td>
				</tr>
				<tr>
					<td width=100 height=10><a href="../photo/content.jsp?no=<%=vo.getNo()%>"><%=vo.getContent() %></a></td>		
				</tr>
			</table>
			</td>
<%
			}
%>
			</tr>
		</table>
<!-- 게시판 표시 주석 줄
	 	<table>
<%
         for(BoardVO vo:list2)
         {
%>
		<tr>
  			<td>  
	  			<a href="../board/content.jsp?&no=<%=vo.getNo()%>"><%=vo.getSubject() %></a>
	  			&nbsp;&nbsp;&nbsp;<%=vo.getName() %> &nbsp;&nbsp;&nbsp;

			</td>
		</tr>
<%
         }
%>
		</table> -->
</body>
</html>