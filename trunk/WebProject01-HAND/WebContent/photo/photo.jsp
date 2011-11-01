<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,com.db.*"%>
    
    
 
 <%!
     int totalpage=0;//총페이지(DB)
     int curpage=1;//현재(수시로 변경)
     
     int back;//이전값
     int forward;//다음값
%> 
<jsp:useBean id="dao" class="com.db.PhotoDAO"/>
<%
	String id=(String)session.getAttribute("id"); 
	String strPage=request.getParameter("page");
	String strNo=request.getParameter("no"); 
	if(strPage==null)
		strPage="1"; 
	curpage=Integer.parseInt(strPage);
	ArrayList<PhotoVO> list=dao.getPhotoData(curpage); 
	totalpage=dao.getTotalPage(); 
	int count=dao.getPhotoCount();
	count=count-((curpage*10)-10); 

%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사진방</title>
</head>
<body>
<center>
<h2>사진방ㅠㅠ</h2>
	
	
	
	<table border=0	width=600 >
	<tr>
	<td>
	<a href="photo_write.jsp"><img src="../image/Photo/write.jpg" align=left></a>
	</td></tr>
	</table>
	<table border=3	width=800>
	<%
	 for(PhotoVO vo:list){
	%>
	<tr>
		<td>
		 <%=vo.getPath() %>
		 </td>
	</tr>
	<tr>
		<td>
		<a href="content.jsp?no=<%=vo.getNo()%>">
		<%=vo.getContent() %></a>
		</td>
	</tr>
	<%
	}
	%>
	</table>
	<table>
	<tr>
       <td align=left>
        <select name=fs>
         <option value=name>작성자</option>
         <option value=subject>제목</option>
        
        </select>
        <input type=text name=ss size=20>
        
        <input type=button value=찾기 >
       </td>
           <tr align=center>
       <td align=center>
     
         <img src="../image/Photo/prev.jpg" border=0>
       		&nbsp;&nbsp;&nbsp;
          	page /  pages
       
         <img src="../image/Photo/next.jpg" border=0>
        
       
       </td>
       </tr>
	</table>
	
	
</center>
</body>
</html>