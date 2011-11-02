<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,com.db.*,java.text.*"%> 
 <%!
     int totalpage=0;//총페이지(DB)
     int curpage=1;//현재(수시로 변경)
     
     int back;//이전값
     int forward;//다음값
%> 
<jsp:useBean id="dao" class="com.db.PhotoDAO"/>
<%
	request.setCharacterEncoding("euc-kr");
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
<script type="text/javascript">
function find()
{
	var f=document.frm;
	if(f.ss.value=="")
    {
		alert("검색어를 입력하세요");
		f.ss.focus();
		return;
    }
	f.submit();
}
</script>
<style type="text/css">
	table {
		table-layout: fixed;
	}	
</style>
</head>
<body>
<center>	
		<form method=post name=frm action="find.jsp">
	<table border=1	width=550 height=200>
	<tr>		
	<%
	int i = 0;
	 for(PhotoVO vo:list){
	%>
	<%
	if(i%3==0 && i!=0){		
	%>
		</tr><tr>	
	<%
	}
	%>						
	<td>
	<table width=100% border=1>
	<tr>
		<td width=100 height=80><img src="../photo/upload/<%=vo.getFilename()+"_tn.jpg"%>"></td>
	</tr>
	<tr>
		<td width=50 height=10><a href="content.jsp?no=<%=vo.getNo()%>"><%=vo.getContent() %></a></td>
	</tr>
	</table>
	</td>		
	<%
	i++;
	}
	%>	
	</tr>
	</table>
	

	<table width=550 height=40>
	<tr>
	<td>
	<a href="photo_write.jsp"><img src="../image/Photo/write.jpg" align=left></a>
	</td>
	
	 <td align=right>
        <select name=fs>
         <option value=name>작성자</option>
         <option value=content>내용</option>
        
        </select>
        <input type=text name=ss size=10>
        <input type=hidden name=page value=<%=curpage %>>
       <input type=button value=검색 onclick=find()>
       </td>
       </tr>
       
           <tr>
       <td align=center colspan=2>
       
        <%
            if(curpage>1)
            {
            	back=curpage-1;
         %>
       <a href="photo.jsp?page=<%=back%>">
     <img src="../image/board/prev.jpg" border=0>
    	</a>
    	<%
            }
         %>
       
     
         
         <%
            for(int j=1;j<=totalpage;j++)
            {
         %>
               [<a href="photo.jsp?page=<%=j%>"><%=j %></a>]
         <%
            }
         %>
         <%
             if(curpage<totalpage) 
             {
            	 forward=curpage+1;
         %>
      	<a href="photo.jsp?page=<%=forward %>">
         <img src="../image/board/next.jpg" border=0></a>
         <%
             }
         %>
      
         &nbsp;&nbsp;&nbsp;
  <%=curpage %> page / <%=totalpage %> pages
       
       </td>
       </tr>
	</table>
	</form>
	
</center>
</body>
</html>