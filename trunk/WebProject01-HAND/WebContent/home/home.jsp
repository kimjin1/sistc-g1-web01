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
    	
    	String d_photo="<img src='../image/home/default.png' width=180 height=250>";
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<table width=600 height=280 border=0>
			<tr>
				<td width=200 align="center" valign="middle">
					<%if(photo!=null){ %>
						<%=photo %>
					<%}else{ %>
						<%=d_photo %>
					<%} %>
				</td>
				<td width=400 align="left">
					<%=nick %><br>
					<%=memo %>
				</td>
			</tr>
		</table>
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